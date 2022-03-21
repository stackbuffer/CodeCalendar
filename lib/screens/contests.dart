import 'dart:convert';

import 'package:codecalendar/widgets/contest_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContestTab extends StatefulWidget {
  String contestUrl;

  ContestTab({required this.contestUrl});

  @override
  State<ContestTab> createState() => _ContestTabState();
}

class _ContestTabState extends State<ContestTab> with AutomaticKeepAliveClientMixin<ContestTab>{

  Future<String> getContestDetails() async {
    var response = await http.get(
      Uri.parse(widget.contestUrl),
      headers: {
        "Accept" : "application/json"
      }
    );

    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getContestDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data == null){
            return const Center(child: CircularProgressIndicator(color: Color(0xff556B2F)));
          }
          else{
            var jsonData = jsonDecode(snapshot.data);

            if(jsonData.length == 0){
              return const Center(child: Text("No contests!", style: TextStyle(fontSize: 18.0)));
            }

            return ListView.builder(
              itemCount: jsonData.length,

              itemBuilder: (BuildContext context, int index){
                return ContestCard(jsonData: jsonData[index]);
              },
            );
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}