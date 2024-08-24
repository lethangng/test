import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/routes.dart';
import '../models/de_thi.dart';
import '../view_models/third_view_model.dart';

class ThirdScreen extends StatelessWidget {
  ThirdScreen({super.key});
  final ThirdViewModel thirdViewModel = Get.put(ThirdViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Đề thi',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                FilledButton(
                    onPressed: () => Get.toNamed(Routes.formInsertScreen),
                    child: const Text('Them')),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: thirdViewModel.deThiListData.length,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (BuildContext context, int index) {
                  return rowDeThi(deThi: thirdViewModel.deThiListData[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowDeThi({required DeThi deThi}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${deThi.idDeThi}',
            style: textDeThi,
          ),
          Text(
            '${deThi.uId}',
            style: textDeThi,
          ),
          Text(
            deThi.time,
            style: textDeThi,
          ),
          Text(
            '${deThi.cauHienTai}',
            style: textDeThi,
          ),
        ],
      ),
    );
  }
}

TextStyle textDeThi = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);
