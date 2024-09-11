
import 'package:fina/View/detail_infomation.dart';
import 'package:fina/View/test_page.dart';
import 'package:get/get.dart';
  // Import HomeView

class BeginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    
    // Tạo một delay 3 giây, sau đó chuyển sang HomeView
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => DetailPage(), transition: Transition.zoom);  // Get.off() sẽ xóa màn hình Splash khỏi stack
    });
  }
}
