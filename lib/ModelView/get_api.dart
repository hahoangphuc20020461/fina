// import 'dart:convert';
// import 'package:fina/Config/api.dart';
// import 'package:fina/Model/stock_model.dart';
// import 'package:http/http.dart' as http;

// class StockService {
  

//   Future<StockData> fetchStockData() async {
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       // Parse dữ liệu JSON nhận được từ API thành object StockData
//       return StockData.fromJson(jsonDecode(response.body));
//     } else {
//       // Nếu server trả về mã lỗi, ném ngoại lệ
//       throw Exception('Failed to load stock data');
//     }
//   }
// }