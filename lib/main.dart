import 'package:fina/View/begin_page.dart';
import 'package:fina/View/detail_infomation.dart';
import 'package:fina/View/home_second_screen.dart';
import 'package:fina/View/news_detail_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stock App',
      home: BeginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
