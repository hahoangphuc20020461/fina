// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fina/Model/feed_model.dart';
import 'package:fina/controller/getx_controller.dart';
import 'package:fina/controller/getx_controller2.dart';
import 'package:fina/utils/Drop_button.dart';
import 'package:fina/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSecondScreen extends StatefulWidget {
  const HomeSecondScreen({super.key});

  @override
  State<HomeSecondScreen> createState() => _HomeSecondScreenState();
}

class _HomeSecondScreenState extends State<HomeSecondScreen> {
  final StockController stockController = Get.put(StockController());
  final FeedController feedController = Get.put(FeedController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                  child: ListView(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PopupMenu(),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListDay(),
                          SizedBox(
                            height: 10,
                          ),
                          ListFeed()
                        ],
                      ),
                    ),
                  ]),
                ))
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget ListDay() {
    final timeSeries = stockController.stockData.value!.timeSeries;
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
              print(index.toString());
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
    var a = feedController.getfeedData().feedList;
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.only(top: 20, bottom: 5),
      decoration: BoxDecoration(
          color: dividerLine.withAlpha(150),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: feedController.getfeedData().feedList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(index.toString());
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
                title: a[index].title!,
                image: a[index].bannerImage!,
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
