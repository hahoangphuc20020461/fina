import 'package:fina/Config/color.dart';
import 'package:fina/View/home_second_screen.dart';
import 'package:fina/View/news_detail_page.dart';
import 'package:fina/controller/animation_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:vertical_barchart/extension/expandedSection.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.lowPrice,
      required this.highPrice,
      required this.openPrice,
      required this.closePrice});
  final String lowPrice;
  final String highPrice;
  final String openPrice;
  final String closePrice;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // AnimationControllerX animationControllerX = Get.put(AnimationControllerX());

  @override
  Widget build(BuildContext context) {
    List<VBarChartModel> bardata = [
      VBarChartModel(
        index: 0,
        label: "Low",
        colors: [themColor, themColor],
        jumlah: 203.33,
        tooltip: widget.lowPrice,
      ),
      VBarChartModel(
        index: 1,
        label: "High",
        colors: [themColor, themColor],
        jumlah: 203.37,
        tooltip: widget.highPrice,
      ),
    ];
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Detail'),
      // ),
      backgroundColor: themColor,

      //   body: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         SizedBox(
      //           height: MediaQuery.of(context).size.height * 0.3,
      //           width: MediaQuery.of(context).size.width,
      //           child: Container(color: themColor,),
      //         ),
      //         ClipRRect(
      //           borderRadius: BorderRadius.circular(50),
      //           child: Container(

      //             height: MediaQuery.of(context).size.height * 0.7,
      //             width: MediaQuery.of(context).size.width,

      //             decoration: BoxDecoration(
      //               color: Colors.white,
      //               //borderRadius: BorderRadius.circular(50)
      //               ),
      //           ),
      //         ),
      // //         Center(
      // //           child: VerticalBarchart(
      // //   maxX: 204,
      // //   data: bardata,
      // //   showLegend: true,
      // //   legend: [
      // //     Vlegend(
      // //       isSquare: false,
      // //       color: Colors.orange,
      // //       text: "Fruits",
      // //     ),
      // //     // Vlegend(
      // //     //   isSquare: false,
      // //     //   color: Colors.teal,
      // //     //   text: "Vegetables",
      // //     // )
      // //   ],
      // // ),
      // //         ),
      //       ],
      //     ),
      //   ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              child: SafeArea(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.off(() => HomeSecondScreen(),
                              transition: Transition.leftToRightWithFade);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: themColor,
                          size: 30,
                        )),
                    Spacer(),
                    Text(
                      'Detail',
                      style: GoogleFonts.poppins(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                // Màu header
                color: themColor,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                // Màu header
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    VerticalBarchart(
                      tooltipSize: 70,
                      maxX: 204,
                      data: bardata,
                      showLegend: true,
                      legend: [
                        Vlegend(
                          isSquare: false,
                          color: themColor,
                          text: "Rate",
                        ),
                        // Vlegend(
                        //   isSquare: false,
                        //   color: Colors.teal,
                        //   text: "Vegetables",
                        // )
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(20)),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 30)),
                        Text(
                          'Open Price: ',
                          style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: themColor),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(20)),
                    Text(
                      widget.openPrice,
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: themColor),
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 30)),
                        Text(
                          'Close Price: ',
                          style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: themColor),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(20)),
                    Text(
                      widget.closePrice,
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: themColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
