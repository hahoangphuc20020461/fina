import 'package:fina/Config/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
 Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(
      "20240910T190900".substring(0, 8) + 'T' + "20240910T190900".substring(9));
      String formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SafeArea(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: themColor,
                        size: 20,
                      ))),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/finance-48.png'), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  'Title',
                  softWrap: true,
                  style: GoogleFonts.poppins(
                      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(Icons.query_builder_outlined, color: themColor,),
                Padding(padding: EdgeInsets.only(left: 12)),
                Text(formattedDate, style: GoogleFonts.poppins(
                  fontSize: 12, color: Colors.black87
                ),)
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(Icons.account_circle_outlined, color: themColor,),
                Padding(padding: EdgeInsets.only(left: 12)),
                Text('Human', style: GoogleFonts.poppins(
                  fontSize: 12, color: Colors.black87
                ),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(Icons.language_outlined, color: themColor,),
                Padding(padding: EdgeInsets.only(left: 12)),
                Text('link', style: GoogleFonts.poppins(
                  fontSize: 12, color: Colors.black87
                ),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12,8, 10),
            child: Row(
              children: [
                Text('Content', style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87
                ),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(children: [
              Icon(Icons.score_outlined, color: themColor,),
              Padding(padding: EdgeInsets.only(left: 12)),
              Text('overall sentiment score: ', style: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black87
            ),)
            ],),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(children: [
              Icon(Icons.favorite, color: themColor,),
              Padding(padding: EdgeInsets.only(left: 12)),
              Text('overall sentiment label: ', style: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black87
            ),)
            ],),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text('Related Topic:', style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87
            ),)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext, int index) {
                return ListTile(
                  title: Text('Titile', style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87
            ),),
            subtitle: Text('sub title', style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87
            ),),
                );
              }),
          )
        ],
      ),
    );
  }
}

