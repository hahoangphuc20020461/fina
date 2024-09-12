import 'package:fina/Model/timeseries_model.dart';
import 'package:fina/ModelView/get_api.dart';
import 'package:get/get.dart';

class APIController extends GetxController {
  var timeSeries = <TimeSeriesData>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchStockData();
  }

  void fetchStockData() async {
    try {
      isLoading(true); // Bắt đầu quá trình loading
      var fetcheData = await StockService().fetchStockData();
      timeSeries(fetcheData as List<TimeSeriesData>?);// Cập nhật dữ liệu user
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false); // Kết thúc quá trình loading
    }

  }
}