import 'package:fina/View/home_second_screen.dart';
import 'package:fina/View/test_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter/animation.dart';

import 'package:get/get.dart';

// ignore: deprecated_member_use
class AnimationControllerX extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();

    // Tạo AnimationController
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Tạo Animation
    Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

    // Khởi động animation
    animationController.forward();

    // Sau 3 giây chuyển sang trang khác
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => HomeSecondScreen(),
          transition: Transition.circularReveal,
          duration: Duration(seconds: 2));
    });
  }

  @override
  void onClose() {
    // Hủy controller khi không dùng nữa
    animationController.dispose();
    super.onClose();
  }

  // void onClick() {
  //   animationControllerNextPage = AnimationController(vsync: this, duration: Duration(milliseconds: 900));
  // }
}
