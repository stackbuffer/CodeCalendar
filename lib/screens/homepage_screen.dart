import 'package:codecalendar/screens/about_screen.dart';
import 'package:codecalendar/screens/contests.dart';
import 'package:codecalendar/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void launchUrl(String url)  async {
    await launch(url);
  }

  void handleClick(String value){
    if(value == "About"){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        return AboutPage();
      }));
    }
    else{
      launchUrl("https://stackbuffer.github.io/privacy_policy_cp.html");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      
      child: Scaffold(
        backgroundColor: creamyWhite,

        //app bar
        appBar: AppBar(
          title: const Text("Code Calendar", style: TextStyle(color: Colors.black, fontFamily: "monospace", fontWeight: FontWeight.bold)),
          
          backgroundColor: creamyWhite,

          actions: [
            PopupMenuButton<String>(
              
              icon: Icon(Icons.more_vert, color: Colors.black),

              color: creamyWhite,
              onSelected: handleClick,
              itemBuilder: (BuildContext context){
                return {'About', 'Privacy Policy'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice, style: TextStyle(fontFamily: "monospace")),
                  );
                }).toList();
              }
            )
          ],

          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: customGreen,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: "monospace"),
            tabs: [
              Tab(text: "All"),
              Tab(text: "AtCoder"),
              Tab(text: "Codechef"),
              Tab(text: "Codeforces"),
              Tab(text: "CS Academy"),
              Tab(text: "HackerEarth"),
              Tab(text: "HackerRank"),
              Tab(text: "KickStart"),
              Tab(text: "Leetcode"),
              Tab(text: "Top Coder")
            ],
          ),
        ),
        //app bar ends

        //body begin
        body: TabBarView(
          children: [
            Center(child: ContestTab(contestUrl: "https://www.kontests.net/api/v1/all")),
            Center(child: ContestTab(contestUrl: "https://www.kontests.net/api/v1/at_coder")),
            Center(child: ContestTab(contestUrl: "https://www.kontests.net/api/v1/code_chef")),
            Center(child: ContestTab(contestUrl: "https://www.kontests.net/api/v1/codeforces")),
            Center(child: ContestTab(contestUrl: "https://www.kontests.net/api/v1/cs_academy")),
            Center(child: ContestTab(contestUrl: "https://www.kontests.net/api/v1/hacker_earth")),
            Center(child: ContestTab(contestUrl: "https://www.kontests.net/api/v1/hacker_rank")),
            Center(child: ContestTab(contestUrl: "https://www.kontests.net/api/v1/kick_start")),
            Center(child: ContestTab(contestUrl: "https://www.kontests.net/api/v1/leet_code")),
            Center(child: ContestTab(contestUrl: "https://www.kontests.net/api/v1/top_coder")),
          ],
        )
    
      ),
    );
  }
}