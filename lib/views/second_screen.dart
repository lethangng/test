import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/first_view_model.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});
  final FirstViewModel firstViewModel = Get.find<FirstViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: FilledButton(
              onPressed: () => firstViewModel.upCount(),
              child: const Text(
                'Up Count',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
