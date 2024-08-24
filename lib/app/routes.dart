import 'package:get/get.dart';

import '../views/first_screen.dart';
import '../views/form_insert_screen.dart';
import '../views/home_screen.dart';
import '../views/order_pay_screen.dart';
import '../views/second_screen.dart';
import '../views/test_2_screen.dart';
import '../views/test_3_screen.dart';
import '../views/test_4_screen.dart';
import '../views/test_5_screen.dart';
import '../views/test_6_screen.dart';
import '../views/custom_dropdown.dart';
import '../views/test_7_screen.dart';
import '../views/third_screen.dart';

class Routes {
  static const firstScreen = '/';
  static const secondScreen = '/second-screen';
  static const thirdScreen = '/third-screen';
  static const test3Screen = '/test-3-screen';
  static const test5Screen = '/test-5-screen';
  static const formInsertScreen = '/form-insert-screen';
  static const orderPay = '/order-pay';

  static final routes = [
    // GetPage(name: firstScreen, page: () => const Test5Screen()),
    GetPage(name: firstScreen, page: () => OrderPayScreen()),
    // GetPage(name: firstScreen, page: () => ThirdScreen()),
    // GetPage(name: firstScreen, page: () => FirstScreen()),
    GetPage(name: test3Screen, page: () => Test3Screen()),
    GetPage(name: secondScreen, page: () => SecondScreen()),
    GetPage(name: thirdScreen, page: () => ThirdScreen()),
    GetPage(name: formInsertScreen, page: () => FormInsertScreen()),
    // GetPage(name: orderPay, page: () => OrderPayScreen()),
  ];
}
