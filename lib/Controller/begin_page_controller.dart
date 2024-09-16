import 'package:fina/View/detail_infomation.dart';
import 'package:fina/View/home_second_screen.dart';
import 'package:fina/View/test_page.dart';
import 'package:fina/controller/getx_controller.dart';
import 'package:get/get.dart';
// Import HomeView

class BeginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    final StockController stockController = Get.put(StockController());

    // Tạo một delay 3 giây, sau đó chuyển sang HomeView
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => HomeSecondScreen(),
          transition:
              Transition.zoom); // Get.off() sẽ xóa màn hình Splash khỏi stack
    });
  }
}
