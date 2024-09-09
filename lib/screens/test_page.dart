import 'package:fina/Model/stock_model.dart';
import 'package:fina/Service/get_api.dart';
import 'package:flutter/material.dart';

class StockPage extends StatefulWidget {
  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  late Future<StockData> stockData;
  StockService stockService = StockService();

  @override
  void initState() {
    super.initState();
    stockData = stockService.fetchStockData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stock Data')),
      body: Center(
        child: FutureBuilder<StockData>(
          future: stockData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Hiển thị vòng tròn chờ khi dữ liệu đang tải
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // Hiển thị lỗi nếu xảy ra
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  Text('Symbol: ${snapshot.data!.metaData.symbol}'),
                  Text(
                      'Last Refreshed: ${snapshot.data!.metaData.lastRefreshed}'),
                  Text(
                      'Open price at 19:55:00: ${snapshot.data!.timeSeries['2024-09-06 19:55:00']?.open}'),
                ],
              );
            } else {
              return Text('No data available'); // Trường hợp không có dữ liệu
            }
          },
        ),
      ),
    );
  }
}