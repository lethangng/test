import 'package:get/get.dart';

import '../database/dethi_table.dart';
import '../models/de_thi.dart';

class ThirdViewModel extends GetxController {
  final DeThiTable _deThiTable = DeThiTable();

  final RxList<DeThi> deThiListData = <DeThi>[].obs;

  void initData() async {
    deThiListData.value = await _deThiTable.selectAllDeThi();
    deThiListData.refresh();
  }

  void handleInsertDeThi(DeThi deThi) async {
    await _deThiTable.insertDeThi(deThi);
    deThiListData.value = await _deThiTable.selectAllDeThi();
    deThiListData.refresh();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
