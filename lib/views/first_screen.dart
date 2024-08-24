import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/routes.dart';
import '../view_models/first_view_model.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  final FirstViewModel firstViewModel = Get.put(FirstViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Text(
                'a = ${firstViewModel.count.value}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            FilledButton(
              onPressed: () => Get.toNamed(Routes.secondScreen),
              child: const Text(
                'SecondScreen',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            FilledButton(
              onPressed: () => Get.toNamed(Routes.thirdScreen),
              child: const Text(
                'ThirdScreen',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
