import 'package:flutter/animation.dart';
import 'package:get/get.dart';

// ignore: deprecated_member_use
class AnimationControllerX extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  var isAnimating = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Khởi tạo AnimationController
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    animationController.dispose();
  }
  void beginAnimation() {
    animationController.forward();
  }
}