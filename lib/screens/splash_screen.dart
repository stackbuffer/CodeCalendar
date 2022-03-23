import 'package:codecalendar/util/colors.dart';
import 'package:flutter/material.dart';
import 'homepage_screen.dart';
//splash screen import
import 'package:animated_splash_screen/animated_splash_screen.dart';


class SplashScreen extends StatefulWidget{
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{
  @override
  Widget build(BuildContext context){
    return AnimatedSplashScreen(

      splash: SplashContainer(),
      nextScreen: HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: creamyWhite,
    );
  }
}

class SplashContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text("Code Calendar by stackbuffer", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "monospace")),
            
            Padding(padding: EdgeInsets.only(top: 3)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Made with ", style: TextStyle(fontFamily: "monospace")),
                Icon(Icons.favorite, color: Colors.red),
                Text(" in India!", style: TextStyle(fontFamily: "monospace"))
              ],
            ),
          ],
        )
      ),
    );
  }
}