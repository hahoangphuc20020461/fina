import 'package:fina/Config/color.dart';

import 'package:fina/Model/ticker_sentiments_model.dart';
import 'package:fina/Model/topics_model.dart';
import 'package:fina/View/home_second_screen.dart';
import 'package:fina/controller/animation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage(
      {super.key,
      required this.timePublished,
      required this.title,
      required this.bannerImage,
      required this.publisher,
      required this.summary,
      required this.url,
      required this.setimentScore,
      required this.setimentLabel,
      required this.topic,
      required this.tickerSentiments});
  final String timePublished;
  final String title;
  final String bannerImage;
  final List<String> publisher;
  final String summary;
  final String url;
  final String setimentScore;
  final String setimentLabel;
  final List<Topics> topic;
  final List<TickerSentiments> tickerSentiments;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  AnimationControllerX animationControllerX = Get.put(AnimationControllerX());
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.timePublished.substring(0, 8) +
        'T' +
        widget.timePublished.substring(9));
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SafeArea(
                child: IconButton(
                    onPressed: () {
                      Get.off(() => HomeSecondScreen(),
                          transition: Transition.leftToRightWithFade);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: themColor,
                      size: 30,
                    )),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.bannerImage), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  widget.title,
                  softWrap: true,
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.query_builder_outlined,
                  color: themColor,
                ),
                Padding(padding: EdgeInsets.only(left: 12)),
                Text(
                  formattedDate,
                  style:
                      GoogleFonts.poppins(fontSize: 12, color: Colors.black87),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: themColor,
                ),
                Padding(padding: EdgeInsets.only(left: 12)),
                for (int i = 0; i < widget.publisher.length; i++)
                  Text(
                    widget.publisher[i],
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: Colors.black87),
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.language_outlined,
                  color: themColor,
                ),
                Padding(padding: EdgeInsets.only(left: 12)),
                Text(
                  widget.url,
                  style:
                      GoogleFonts.poppins(fontSize: 12, color: Colors.black87),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 10),
            child: Row(
              children: [
                Text(
                  widget.summary,
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.score_outlined,
                  color: themColor,
                ),
                Padding(padding: EdgeInsets.only(left: 12)),
                Text(
                  widget.setimentScore,
                  style:
                      GoogleFonts.poppins(fontSize: 13, color: Colors.black87),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: themColor,
                ),
                Padding(padding: EdgeInsets.only(left: 12)),
                Text(
                  widget.setimentLabel,
                  style:
                      GoogleFonts.poppins(fontSize: 13, color: Colors.black87),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Ticker')),
                DataColumn(label: Text('Relevance Score')),
                DataColumn(label: Text('Sentiment Score')),
                DataColumn(label: Text('Sentiment Label')),
              ],
              rows: widget.tickerSentiments.map((item) {
                return DataRow(
                  cells: [
                    DataCell(Text(item.ticker!)),
                    DataCell(Text(item.relevanceScore!)),
                    DataCell(Text(item.tickerSentimentsScore!)),
                    DataCell(Text(item.tickerSentimentsLabel!)),
                  ],
                );
              }).toList(),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text(
                  'Related Topic:',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.topic.length,
                itemBuilder: (BuildContext, int index) {
                  return ListTile(
                    title: Text(
                      'Topic: ${widget.topic[index].topic}',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    subtitle: Text(
                      'Relevance Score: ${widget.topic[index].relevanceScore}',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
