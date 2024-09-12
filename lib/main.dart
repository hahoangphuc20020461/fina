
import 'package:fina/View/home_second_screen.dart';
import 'package:fina/View/stock_screen.dart';
import 'package:fina/View/Widget/Drop_button.dart';
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
