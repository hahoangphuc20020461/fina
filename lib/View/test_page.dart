import 'package:fina/Config/color.dart';
import 'package:fina/Controller/begin_page_controller.dart';
import 'package:fina/View/begin_page.dart';
import 'package:fina/controller/animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class KaKaPage extends StatefulWidget {
  const KaKaPage({super.key});

  @override
  State<KaKaPage> createState() => _KaKaPageState();
}

class _KaKaPageState extends State<KaKaPage> {
  final List<Map<String, dynamic>> data = [
    {
      "ticker": "META",
      "relevance_score": "0.332211",
      "ticker_sentiment_score": "0.288365",
      "ticker_sentiment_label": "Somewhat-Bullish"
    },
    {
      "ticker": "NVDA",
      "relevance_score": "0.393462",
      "ticker_sentiment_score": "0.327964",
      "ticker_sentiment_label": "Somewhat-Bullish"
    },
    {
      "ticker": "AAPL",
      "relevance_score": "0.534374",
      "ticker_sentiment_score": "0.458188",
      "ticker_sentiment_label": "Bullish"
    },
    {
      "ticker": "AAPL",
      "relevance_score": "0.534374",
      "ticker_sentiment_score": "0.458188",
      "ticker_sentiment_label": "Bullish"
    },
    {
      "ticker": "AAPL",
      "relevance_score": "0.534374",
      "ticker_sentiment_score": "0.458188",
      "ticker_sentiment_label": "Bullish"
    }
  ];
  @override
   Widget build(BuildContext context) {
    // Khởi tạo SplashController
    //final BeginController controller = Get.put(BeginController());
    final AnimationControllerX animationControllerX = Get.put(AnimationControllerX());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: themColor,  // Màu xanh của màn hình Splash
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Image.asset(
                    'assets/finance-48.png',
                  ),
                )
              ),
            ),
        
            GetBuilder(
              builder: (AnimationControllerX controller) { 
                return ElevatedButton(onPressed: (){
              Get.to(() => BeginPage(), transition: Transition.leftToRightWithFade);
              }, child: Text('data'), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amberAccent)),);
               },
               
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: [
                DataColumn(label: Text('Ticker')),
              DataColumn(label: Text('Relevance Score')),
              // DataColumn(label: Text('Sentiment Score')),
              // DataColumn(label: Text('Sentiment Label')),
              ], rows: data.map((item) {
              return DataRow(
                cells: [
                  DataCell(Text(item['ticker'])),
                  DataCell(Text(item['relevance_score'])),
                  // DataCell(Text(item['ticker_sentiment_score'])),
                  // DataCell(Text(item['ticker_sentiment_label'])),
                ],
              );
                        }).toList(),),
            )
          ],
        ),
      ),
    );
  }
}


