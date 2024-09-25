// import 'package:fina/controller/getx_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class StockScreen extends StatelessWidget {
//   final StockController stockController = Get.put(StockController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Real-time Stock Data'),
//       ),
//       body: Obx(() {
//         if (stockController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else if (stockController.stockData.value == null) {
//           return Center(child: Text('No data available'));
//         } else {
//           // Lấy dữ liệu từ controller
//           final metaData = stockController.stockData.value!.metaData;
//           final timeSeries = stockController.stockData.value!.timeSeries;

//           return ListView.builder(
//             itemCount: timeSeries!.length,
//             itemBuilder: (context, index) {
//               final timeEntry = timeSeries.entries.toList()[index];
//               final timestamp = timeEntry.key;
//               final data = timeEntry.value;

//               return ListTile(
//                 title: Text('Timestamp: $timestamp'),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Open: ${data.open}'),
//                     Text('High: ${data.high}'),
//                     Text('Low: ${data.low}'),
//                     Text('Close: ${data.close}'),
//                     Text('Volume: ${data.volume}'),
//                     Text('infor: ${metaData!.information.toString()}'),
//                   ],
//                 ),
//               );
//             },
//           );
//         }
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: stockController.fetchStockData, // Làm mới dữ liệu khi nhấn
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }
