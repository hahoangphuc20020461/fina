import 'package:fina/screen/home_screen.dart';
import 'package:fina/screen/home_second_screen.dart';
import 'package:fina/screen/stock_screen.dart';
import 'package:fina/utils/Drop_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stock App',
      home: HomeSecondScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
