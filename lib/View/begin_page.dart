import 'package:fina/Config/color.dart';
import 'package:fina/Controller/begin_page_controller.dart';

import 'package:fina/controller/animation_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeginPage extends StatefulWidget {
  const BeginPage({super.key});

  @override
  State<BeginPage> createState() => _BeginPageState();
}

class _BeginPageState extends State<BeginPage> {
  @override
  Widget build(BuildContext context) {
    // Khởi tạo SplashController
    final BeginController controller = Get.put(BeginController());
    final animationControllerX = Get.put(AnimationControllerX());

    return Scaffold(
      body: GetBuilder(
        builder: (AnimationControllerX xcontroller) {
          return FadeTransition(
            opacity: xcontroller.animationController,
            child: Container(
              color: themColor, // Màu xanh của màn hình Splash
              child: Center(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Image.asset(
                  'assets/finance-48.png',
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
