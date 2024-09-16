// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fina/Model/feed_model.dart';
import 'package:fina/View/detail_infomation.dart';
import 'package:fina/controller/getx_controller.dart';
import 'package:fina/utils/Drop_button.dart';
import 'package:fina/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSecondScreen extends StatefulWidget {
  const HomeSecondScreen({super.key});

  @override
  State<HomeSecondScreen> createState() => _HomeSecondScreenState();
}

class _HomeSecondScreenState extends State<HomeSecondScreen> {
  final stockController = Get.find<StockController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                              height: 30,
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
                                Container(
                                  height: 30,
                                  width: 2,
                                  color: white_color,
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
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Text(
                                //       'Last Updates',
                                //       style: TextStyle(
                                //           color: white_color,
                                //           fontSize: 12,
                                //           decoration: TextDecoration.none),
                                //     ),
                                //     Text(
                                //         // stockController.getMetaData().symbol!.toString(),
                                //         'Now',
                                //         style: GoogleFonts.poppins(
                                //             color: white_color,
                                //             fontSize: 18,
                                //             fontWeight: FontWeight.bold)),
                                //   ],
                                // ),
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
                    padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PopupMenu(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Obx(() {
                                if (stockController.isLoading.value) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return ListDay();
                                }
                              }),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("New Feed",
                                      style: GoogleFonts.poppins(
                                          color: themColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Obx(() {
                                if (stockController.isLoading.value) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return ListFeed();
                                }
                              })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ListDay() {
    // final timeSeries = stockController.stockData.value!.timeSeries;
    var timeSeries;
    if (stockController.finaIndex.value == 'Hour') {
      timeSeries = stockController.stockData.value!.timeSeries;
    } else if (stockController.finaIndex.value == 'Week') {
      timeSeries = stockController.stockWeekData.value!.timeSeries;
    } else if (stockController.finaIndex.value == 'Month') {
      timeSeries = stockController.stockMonthData.value!.timeSeries;
    } else {
      timeSeries = stockController.stockDayData.value!.timeSeries;
    }
    return Container(
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
              Get.to(DetailPage());
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
                  Time: timestamp, open: data.open, close: data.close),
            ),
          );
        },
      ),
    );
  }

  Widget ListFeed() {
    var a = stockController.getfeedData().feedList;
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      // padding: EdgeInsets.only(top: 20, bottom: 5),
      decoration: BoxDecoration(
        color: dividerLine.withAlpha(150),
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: stockController.getfeedData().feedList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(index.toString());
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
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
                title: a[index].title ?? '',
                image: a[index].bannerImage ?? '',
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
        border: Border.all(width: 1),
        color: themColor,
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
                  style: TextStyle(color: white_color),
                ),
                Text(
                  Time,
                  style: TextStyle(color: white_color),
                ),
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
                  style: TextStyle(fontSize: 12, color: white_color),
                ),
                Text(
                  'Close Price: ' + close,
                  style: TextStyle(fontSize: 12, color: white_color),
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
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: themColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.only(top: 4, bottom: 4),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  title,
                  softWrap: true,
                  maxLines: 2, // Giới hạn số dòng (ở đây là 1 dòng)
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(fontSize: 12, color: white_color),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
