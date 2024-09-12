import 'dart:convert';

import 'package:fina/Model/feed_model.dart';
import 'package:fina/api/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FeedController extends GetxController {
  var isLoading = true.obs; // Trạng thái loading
  var feedData = Rxn<FeedData>();
  FeedData getfeedData() {
    return feedData.value!;
  }

  @override
  void onInit() {
    super.onInit();
    fetchfeedData(); // Tự động gọi khi controller được khởi tạo
  }

  Future<void> fetchfeedData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url2));
      if (response.statusCode == 200) {
        var jsonstring = jsonDecode(response.body);
        feedData.value = FeedData.fromJson(jsonstring);
        // Cập nhật dữ liệu
      } else {
        throw Exception('Failed to load stock data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
