import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/controller_bindings.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      title: 'Test App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.firstScreen,
      getPages: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
