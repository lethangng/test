import 'package:get/get.dart';

import '../database/dethi_database.dart';

class AppController extends GetxController {
  Future<void> initData() async {
    await DeThiDatabase.instance.database;
  }

  @override
  void onInit() {
    super.onInit();
    initData();
  }
}
