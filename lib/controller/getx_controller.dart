import 'dart:async';
import 'dart:convert';
import 'package:fina/Model/feed_model.dart';
import 'package:fina/Model/stockDay_model.dart';
import 'package:fina/Model/stockMonth_model.dart';
import 'package:fina/Model/stockWeek_model.dart';
import 'package:fina/Model/stock_model.dart';
import 'package:fina/api/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StockController extends GetxController {
  var isLoading = true.obs; // Trạng thái loading
  var stockData = Rxn<StockData>();
  var stockWeekData = Rxn<StockWeekData>();
  var stockDayData = Rxn<StockDayData>();
  var stockMonthData = Rxn<StockMonthData>();
  // var metaData = Rxn<MetaData>();
  final RxString finaIndex = "Hour".obs;
  final RxString symbolIndex = "IBM".obs;
  Timer? timer;
  // Rxn quản lý dữ liệu thời gian thực
  // MetaData getMetaData() {
  //   return metaData.value!;
  // }

  var feedData = Rxn<FeedData>();
  FeedData getfeedData() {
    return feedData.value!;
  }

  @override
  void onInit() {
    super.onInit();
    fetchStockData();
    fetchfeedData();
    fetchStockWeekData();
    fetchStockMonthData();
    fetchStockDayData();
    timer = Timer.periodic(Duration(minutes: 3), (Timer t) {
      fetchStockData();
      fetchfeedData();
    }); // Tự động gọi khi controller được khởi tạo
  }

  @override
  void onClose() {
    // Hủy Timer khi controller bị hủy
    timer?.cancel();
    super.onClose();
  }

  Future<void> fetchStockData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonstring = jsonDecode(response.body);
        stockData.value = StockData.fromJson(jsonstring);
        // metaData.value =
        //     MetaData.fromJson(jsonstring['Meta Data']); // Cập nhật dữ liệu
      } else {
        throw Exception('Failed to load stock data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchStockDayData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(urlDay));
      if (response.statusCode == 200) {
        var jsonstring = jsonDecode(response.body);
        stockDayData.value = StockDayData.fromJson(jsonstring);
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

  Future<void> fetchStockWeekData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(urlWeek));
      if (response.statusCode == 200) {
        var jsonstring = jsonDecode(response.body);
        stockWeekData.value = StockWeekData.fromJson(jsonstring);
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

  Future<void> fetchStockMonthData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(urlMonth));
      if (response.statusCode == 200) {
        var jsonstring = jsonDecode(response.body);
        stockMonthData.value = StockMonthData.fromJson(jsonstring);
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
