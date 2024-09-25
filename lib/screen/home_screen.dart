// import 'package:fina/controller/getx_controller.dart';
// import 'package:fina/utils/color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final StockController stockController = Get.put(StockController());
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: stockController.fetchStockData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Obx(() {
//             return Center(
//               //     child: Text(
//               //   stockController.getMetaData().information!.toString(),
//               //   style: TextStyle(
//               //       fontSize: 20,
//               //       fontWeight: FontWeight.normal,
//               //       color: Colors.black,
//               //       decoration: TextDecoration.none),
//               // )
//               child: CenterHome(),
//             );
//           });
//         }
//         // var a = snapshot.data;

//         // Tùy chọn hiển thị chỉ báo tải trong khi đang lấy dữ liệu
//         return Center(child: CircularProgressIndicator());
//       },
//     );
//   }

//   Widget CenterHome() {
//     return Scaffold(
//       body: Container(
//         color: themColor,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           'Symbol',
//                           style: TextStyle(
//                               color: black_color,
//                               fontSize: 12,
//                               decoration: TextDecoration.none),
//                         ),
//                         Text(
//                             // stockController.getMetaData().symbol!.toString(),
//                             'IBM',
//                             style: TextStyle(
//                                 color: white_color,
//                                 fontSize: 18,
//                                 decoration: TextDecoration.none)),
//                       ],
//                     ),
//                     Divider(
//                       color: Colors.white,
//                       thickness: 2,
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           'Time Zone',
//                           style: TextStyle(
//                               color: black_color,
//                               fontSize: 12,
//                               decoration: TextDecoration.none),
//                         ),
//                         Text(
//                             // stockController.getMetaData().timeZone!.toString()
//                             'US',
//                             style: TextStyle(
//                                 color: white_color,
//                                 fontSize: 18,
//                                 decoration: TextDecoration.none)),
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
