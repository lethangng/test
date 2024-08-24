// import 'package:demo_app/views/calendar.dart';
// import 'package:demo_app/views/calendar_2.dart';
import 'package:demo_app/views/calendar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Xet mau trong suot cho thanh status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  // runApp(const App());
  // runApp(const CalendarApp());
  runApp(const MyApp());
}
