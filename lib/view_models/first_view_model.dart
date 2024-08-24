import 'package:get/get.dart';

class FirstViewModel extends GetxController {
  final RxInt count = 0.obs;

  void upCount() {
    count.value++;
  }
}
