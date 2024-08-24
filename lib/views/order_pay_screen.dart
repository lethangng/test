import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/order_pay_viewmodel.dart';

class OrderPayScreen extends StatelessWidget {
  OrderPayScreen({super.key});
  final PayOrderViewmodel _payOrderViewmodel = Get.put(PayOrderViewmodel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _payOrderViewmodel.main(),
          child: const Text('Send'),
        ),
      ),
    );
  }
}
