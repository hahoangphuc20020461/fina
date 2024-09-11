import 'dart:convert';
import 'package:fina/Model/metadata_model.dart';
import 'package:fina/Model/stock_model.dart';
import 'package:fina/api/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StockController extends GetxController {
  var isLoading = true.obs; // Trạng thái loading
  var stockData = Rxn<StockData>();
  var metaData = Rxn<MetaData>();
  // Rxn quản lý dữ liệu thời gian thực
  MetaData getMetaData() {
    return metaData.value!;
  }

  @override
  void onInit() {
    super.onInit();
    fetchStockData(); // Tự động gọi khi controller được khởi tạo
  }

  Future<void> fetchStockData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonstring = jsonDecode(response.body);
        stockData.value = StockData.fromJson(jsonstring);
        metaData.value =
            MetaData.fromJson(jsonstring['Meta Data']); // Cập nhật dữ liệu
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
