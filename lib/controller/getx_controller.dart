import 'dart:convert';
import 'package:fina/Model/feed_model.dart';
import 'package:fina/Model/metadata_model.dart';
import 'package:fina/Model/stock_model.dart';
import 'package:fina/Model/ticker_sentiments_model.dart';
import 'package:fina/Model/topics_model.dart';
import 'package:fina/Config/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class APIController extends GetxController {
  var isLoading = true.obs; // Trạng thái loading
  var stockData = Rxn<StockData>();
  var metaData = Rxn<MetaData>();
  var feedData = Rxn<FeedData>();
  // var topicData = Rxn<Topics>();
  // var tickerData = Rxn<TickerSentiments>();
  // Rxn quản lý dữ liệu thời gian thực
  MetaData getMetaData() {
    return metaData.value!;
  }
  FeedData getfeedData() {
    return feedData.value!;
  }
  // Topics getTopicData() {
  //   return topicData.value!;
  // }
  // TickerSentiments getTickerData() {
  //   return tickerData.value!;
  // }

  @override
  void onInit() {
    super.onInit();
    fetchStockData();
    fetchfeedData(); // Tự động gọi khi controller được khởi tạo
  }

  Future<void> fetchfeedData() async {
    try {
      isLoading(true);
      //final response = await http.get(Uri.parse(url2));
      final response = await http.get(Uri.parse(apiDemo2));
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
  Future<void> fetchStockData() async {
    try {
      isLoading(true);
      //final response = await http.get(Uri.parse(url));
      final response = await http.get(Uri.parse(apiDemo1));
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
