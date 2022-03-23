import 'package:codecalendar/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:add_2_calendar/add_2_calendar.dart';


class ContestCard extends StatefulWidget {
  
  var jsonData;
  ContestCard({required this.jsonData});
  
  @override
  State<ContestCard> createState() => _ContestCardState();
}

class _ContestCardState extends State<ContestCard> {


  //launch a url in the browser using url_launcher library
  void launchUrl(String url) async {
    await launch(url);
  }

  //converts seconds into hh:mm format
  List<int> convertToHours(String seconds){
    double mins = (double.parse(seconds))/60;

    double hoursInFractional = mins/60;

    int hours = hoursInFractional.floor();
    int minutes = ((hoursInFractional - hours)*60).toInt();

    return [hours, minutes];
  }

  //allows a user to add an event to the calendar
  void addToCalendar(String title, String start, String end){
    DateTime startDate = DateTime.parse(start);
    DateTime endDate = DateTime.parse(end);
    
    Event event = Event(title: title, startDate: startDate, endDate: endDate);

    Add2Calendar.addEvent2Cal(event);
  }


  //converts to local time
  String convertToLocalTime(var current_time){
    var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(current_time, true);
    var local_time = dateTime.toLocal();

    return local_time.toString();
  }

  //converts to utc
  String convertToUTC(String current_time){
    current_time = current_time.replaceAll(" UTC", "");
    current_time = current_time.replaceAll("T", " ");
    current_time = current_time.replaceAll(".000Z", "");

    return current_time;
  }


  @override
  Widget build(BuildContext context) {
    
    var jsonData = widget.jsonData;
    var duration = convertToHours(jsonData["duration"]);

    //convert time to UTC
    String start_time = convertToUTC(jsonData["start_time"]);
    String end_time = convertToUTC(jsonData["end_time"]);

    //convert UTC time to local time
    String start_local = convertToLocalTime(start_time);
    String end_local = convertToLocalTime(end_time);

    start_local = start_local.replaceAll(".000", "");
    end_local = end_local.replaceAll(".000", "");

    List<String> startContest = start_local.split(" ");
    List<String> endContest = end_local.split(" ");

    String status;
    
    if(jsonData["status"] == "CODING"){
      status = "Ongoing";
    }
    else{
      status = "Upcoming";
    }


    return Card(

      color: creamyWhite,

      elevation: 2.0,

      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 8.0)),
          Text(
            jsonData["name"], 
            
            style: const TextStyle(
              fontSize: 18.0, 
              fontWeight: FontWeight.bold, 
              color: Colors.black, 
              fontFamily: "monospace"
            ),

            textAlign: TextAlign.center
          ),
          
          const Padding(padding: EdgeInsets.only(top: 8.0)),

          Divider(color: customGreen, thickness: 2.0, indent: 40, endIndent: 40),

          //start and end dates
          Text("Start: ${startContest[0]}, Time: ${startContest[1]}", style: const TextStyle(fontSize: 14.0, fontFamily: "monospace")),
          Text("End: ${endContest[0]}, Time: ${endContest[1]}", style: const TextStyle(fontSize: 14.0, fontFamily: "monospace")),
          
          Divider(color: customGreen, thickness: 2.0, indent: 40, endIndent: 40),
          

          const Padding(padding: EdgeInsets.only(top: 8.0)),
          
          Text("Total duration: ${duration[0]} hrs ${duration[1]} mins", style: const TextStyle(fontSize: 14.0, fontFamily: "monospace")),
          Padding(padding: EdgeInsets.only(top: 6.0)),
          Text("Status: $status", style: const TextStyle(color: customDarkGreen, fontSize: 16.0, fontFamily: "monospace")),

          
          Divider(color: customGreen, thickness: 2.0),

          //space buttons evenly
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: customGreen,
                ),
                
                onPressed: () => launchUrl(jsonData["url"]),
                child: const Text("Register", style: TextStyle(color: Colors.white, fontFamily: "monospace")),
              ),

              //add to calendar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: customGreen,
                ),
                
                onPressed: () => addToCalendar(jsonData["name"], start_local, end_local),
                child: const Text("Add to Calendar", style: TextStyle(color: Colors.white, fontFamily: "monospace")),
              ),
            ],
          ),

          const Padding(padding: EdgeInsets.only(top: 8.0))
        ],
      ),
    );
  }
}