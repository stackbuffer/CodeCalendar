import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({ Key? key }) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  void launchUrl(String url) async {
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEF8EF),
      appBar: AppBar(
        title: Text("About", style: TextStyle(color: Colors.black, fontFamily: "monospace", fontWeight: FontWeight.bold)), 
        backgroundColor: Color(0xffFEF8EF),

        iconTheme: IconThemeData(color: Colors.black),  
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top:12.0)),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Code Calendar is developed by me, stackbuffer. It allows you to keep track of contests in various online judges. I have this superpower called 'yOufOrGeTiMpoRtANtStUfFyOuIdiOT' and I always miss contests on Codeforces and Leetcode(I suck at competitive programming, so forget about codeforces lol).",
              style: TextStyle(fontFamily: "monospace"),
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 10.0)),

          Divider(color:Color(0xff006400), thickness: 1.0),

          Text(
            "Libraries used:                ",
            style: TextStyle(fontSize: 20.0, fontFamily: "monospace", color: Color(0xff006400)), 
            textAlign: TextAlign.start
          ),
          
          Padding(padding: EdgeInsets.only(top: 8.0)),
          
          Text(
            "Flutter SDK\ncupertino_icons: ^1.0.2\nhttp: ^0.13.4\nurl_launcher: ^6.0.20\nintl: ^0.17.0\nadd_2_calendar: ^2.1.3\nanimated_splash_screen: ^1.2.0                     ",
            style: TextStyle(fontSize: 14.0, fontFamily: "monospace")
          ),
          

          Padding(padding: EdgeInsets.only(top:12.0)),
          
          Divider(color:Color(0xff006400), thickness: 1.0),

          
          InkWell(
            child: Text(
              "stackbuffer on GitHub", 
              style: TextStyle(
                color: Colors.green, 
                fontSize: 16.0, 
                fontFamily: "monospace",
                decoration: TextDecoration.underline
              )
              
            ),

            onTap: (){
              launchUrl("https://github.com/stackbuffer");
            },
          ),
          
          Padding(padding: EdgeInsets.only(top:12.0)),

        
          InkWell(
            child: Text(
              "Tap here to check out my other apps.",
              style: TextStyle(
                fontFamily: "monospace", 
                color: Colors.blue,
                fontSize: 18.0,
                decoration: TextDecoration.underline
              ), 
              textAlign: TextAlign.center
            ),

            onTap: (){
              launchUrl("https://play.google.com/store/apps/developer?id=stackbuffer");
            }

          ),

          Padding(padding: EdgeInsets.only(top:12.0)),

          Spacer(),
          
          Text("Powered by https://www.kontests.net/api", style: TextStyle(color: Colors.black, fontSize: 14.0, fontFamily: "monospace")),
        
          Spacer(),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Made with ", style: TextStyle(fontFamily: "monospace")),
              Icon(Icons.favorite, color: Colors.red),
              Text(" in India!", style: TextStyle(fontFamily: "monospace"))
            ],
          ),

          Padding(padding: EdgeInsets.only(top: 3))
        
        ],
      )
    );
  }
}