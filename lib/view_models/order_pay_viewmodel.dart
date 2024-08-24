import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

class PayOrderViewmodel extends GetxController {
  static const MethodChannel platform =
      MethodChannel('flutter.native/channelPayOrder');

  final config = {
    'app_id': '2554',
    'key1': 'sdngKKJmqEMzvh5QQcdD2A9XBSKUNaYn',
    'key2': 'trMrHtvjo6myautxDUiAcYsVtaeQ8nhf',
    'endpoint': 'https://sb-openapi.zalopay.vn/v2/create',
  };

  String getCurrentTimeString(String format) {
    final now = DateTime.now().toUtc().add(const Duration(hours: 7));
    return DateFormat(format).format(now);
  }

  Future<void> main() async {
    final random = Random();
    final randomId = random.nextInt(1000000);
    final embedData = {};
    final item = [{}];

    final order = {
      'app_id': config['app_id'],
      'app_trans_id': '${getCurrentTimeString('yyMMdd')}_$randomId',
      'app_time': DateTime.now().millisecondsSinceEpoch,
      'app_user': 'user123',
      'amount': 50000,
      'description': 'Lazada - Payment for the order #$randomId',
      'bank_code': 'zalopayapp',
      'item': jsonEncode(item),
      'embed_data': jsonEncode(embedData),
    };

    final data =
        '${order['app_id']}|${order['app_trans_id']}|${order['app_user']}|${order['amount']}|${order['app_time']}|${order['embed_data']}|${order['item']}';
    order['mac'] = hmacSha256Hex(config['key1']!, data);

    final response =
        await http.post(Uri.parse(config['endpoint']!), body: order);
    final result = jsonDecode(response.body);
    for (final key in result.keys) {
      print('$key = ${result[key]}');
    }
  }

  String hmacSha256Hex(String key, String data) {
    final hmac = Hmac(sha256, utf8.encode(key));
    final digest = hmac.convert(utf8.encode(data));
    // return hex.encode(digest.bytes);
    return '$digest';
  }

  Future<void> pay() async {
    final String result =
        await platform.invokeMethod('payOrder', {"zptoken": "zpToken"});
  }
}
