import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/de_thi.dart';
import '../view_models/third_view_model.dart';

class FormInsertScreen extends StatelessWidget {
  FormInsertScreen({super.key});
  final ThirdViewModel thirdViewModel = Get.put(ThirdViewModel());
  final TextEditingController idController = TextEditingController();
  final TextEditingController uIdController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController cauHienTaiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              input(
                controller: idController,
                textHind: 'idDeThi',
              ),
              input(
                controller: uIdController,
                textHind: 'uID',
              ),
              input(
                controller: timeController,
                textHind: 'Time',
              ),
              input(
                controller: cauHienTaiController,
                textHind: 'Cau hien tai',
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () {
                  DeThi deThi = DeThi(
                    idDeThi: int.parse(idController.text),
                    uId: int.parse(uIdController.text),
                    time: timeController.text,
                    cauHienTai: int.parse(cauHienTaiController.text),
                  );

                  thirdViewModel.handleInsertDeThi(deThi);
                },
                child: const Text(
                  'Them',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget input({
    required TextEditingController controller,
    required String textHind,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: textHind,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
