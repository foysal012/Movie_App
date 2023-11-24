import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/bottom%20nav%20bar/bottom_navigation_bar_page_screen.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({Key? key}) : super(key: key);

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(
    Duration(seconds: 3),
            () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BottomNavigationBarPageScreen()));
            }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: height * 0.2,),


            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("images/w1.png"), fit: BoxFit.cover)
              ),
            ),

            SizedBox(height: height * 0.001,),

            Text("Movie App",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
            ),

            SizedBox(height: height * 0.15,),

        SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.red : Colors.black,
              ),
            );
          },
        ),

            SizedBox(height: height * 0.05,),

            Text("Design & Developed By",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16
            ),
            ),
            Text("Foysal Joarder",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25
              ),
            ),

          ],
        ),
      ),
    );
  }
}
