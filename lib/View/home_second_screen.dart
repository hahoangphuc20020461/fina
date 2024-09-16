// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fina/Config/color.dart';
import 'package:fina/View/Widget/Drop_button.dart';
import 'package:fina/View/detail_infomation.dart';
import 'package:fina/View/news_detail_page.dart';
import 'package:fina/controller/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSecondScreen extends StatefulWidget {
  const HomeSecondScreen({super.key});

  @override
  State<HomeSecondScreen> createState() => _HomeSecondScreenState();
}

class _HomeSecondScreenState extends State<HomeSecondScreen> {
  late APIController apiController = Get.put(APIController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        body: Container(
          color: themColor,
          child:
              // ListView(
              //   scrollDirection: Axis.vertical,
              //   children: [],
              // )
              Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Text(
                              'FINA',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: white_color),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Symbol',
                                      style: TextStyle(
                                          color: white_color,
                                          fontSize: 12,
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                        // stockController.getMetaData().symbol!.toString(),
                                        'IBM',
                                        style: GoogleFonts.poppins(
                                            color: white_color,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Time Zone',
                                      style: TextStyle(
                                          color: white_color,
                                          fontSize: 12,
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                        // stockController.getMetaData().timeZone!.toString()
                                        'US',
                                        style: GoogleFonts.poppins(
                                            color: white_color,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Last Updates',
                                      style: TextStyle(
                                          color: white_color,
                                          fontSize: 12,
                                          decoration: TextDecoration.none),
                                    ),
                                    Text(
                                        // stockController.getMetaData().symbol!.toString(),
                                        'Now',
                                        style: GoogleFonts.poppins(
                                            color: white_color,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
                Expanded(
                    child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: white_color,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropdownStyledExample(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          if(!apiController.isLoading.value) {
                           return Center(child: CircularProgressIndicator());
                          } else {
                           return ListDay();
                          }
                        } ),
                        
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          if(!apiController.isLoading.value) {
                           return Center(child: CircularProgressIndicator());
                          } else {
                           return ListFeed();
                          }
                        } )
                       
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      );
    
  }

  Widget ListDay() {
    final timeSeries = apiController.stockData.value!.timeSeries;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 160,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final timeEntry = timeSeries!.entries.toList()[index];
          final timestamp = timeEntry.key;
          final data = timeEntry.value;
          return GestureDetector(
            onTap: () {
              print(index.toString());
              // Get.to(() => DetailPage(
              //       lowPrice: data.low ?? ''  ,
              //       highPrice: data.high ?? '',
              //       openPrice: data.open ?? '',
              //       closePrice: data.close ?? '',
              //     ),
              //     transition: Transition.zoom);
            },
            child: Container(
              width: 104,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.5, 0),
                        blurRadius: 30,
                        spreadRadius: 1,
                        color: dividerLine.withAlpha(150))
                  ]),
              child: ItemListDay(
                  Time: timestamp, open: data.open ?? '', close: data.close ?? ''),
            ),
          );
        },
      ),
    );
  }

  Widget ListFeed() {
    var newsData = apiController.getfeedData().feedList;
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: EdgeInsets.only(top: 20, bottom: 5),
      decoration: BoxDecoration(
          color: dividerLine.withAlpha(150),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: apiController.getfeedData().feedList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(index.toString());
              // Get.to(() => NewsDetailPage(
              //     timePublished: newsData[index].timePublished ?? '',
              //     title: newsData[index].title ?? '',
              //     bannerImage: newsData[index].bannerImage ?? '',
              //     publisher: newsData[index].authors?[index] ?? 'unknown',
              //     summary: newsData[index].summary ?? '',
              //     url: newsData[index].url ?? '',
              //     setimentScore: newsData[index].overallSentimentScore ?? '',
              //     setimentLabel: newsData[index].overallSentimentLabel ?? '',
              //      topic: newsData[index].topics ?? [],
              //       tickerSentiments: newsData[index].tickerSentiments ?? []),
              //     transition: Transition.zoom);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.5, 0),
                      blurRadius: 30,
                      spreadRadius: 1,
                      color: dividerLine.withAlpha(150))
                ],
              ),
              child: ItemListFeed(
                title: newsData[index].title ?? '',
                image: newsData[index].bannerImage ?? '',
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemListDay extends StatelessWidget {
  late String Time;
  String open;
  String close;
  ItemListDay({
    super.key,
    required this.Time,
    required this.open,
    required this.close,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: themColor, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time',
                ),
                Text(Time),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4, bottom: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Open Price: ' + open,
                  style: TextStyle(fontSize: 12, color: black_color),
                ),
                Text(
                  'Close Price: ' + close,
                  style: TextStyle(fontSize: 12, color: black_color),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemListFeed extends StatelessWidget {
  String image;
  String title;
  ItemListFeed({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            child: Text(
              title,
              softWrap: true,
              maxLines: 1, // Giới hạn số dòng (ở đây là 1 dòng)
              overflow: TextOverflow.ellipsis,

              style: TextStyle(fontSize: 12, color: black_color),
            ),
          )
        ],
      ),
    );
  }
}
