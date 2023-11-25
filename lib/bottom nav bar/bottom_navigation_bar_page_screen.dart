import 'package:flutter/material.dart';
import 'package:movie_app/screen/home_page_screen.dart';
import 'package:movie_app/screen/search_page_screen.dart';

class BottomNavigationBarPageScreen extends StatefulWidget {
  const BottomNavigationBarPageScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPageScreen> createState() => _BottomNavigationBarPageScreenState();
}

class _BottomNavigationBarPageScreenState extends State<BottomNavigationBarPageScreen> {

  List<Widget> pages = [
    HomePageScreen(),
    SearchPageScreen()
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,

          onTap: (value){
            setState(() {
              currentIndex = value;
            });
          },

          backgroundColor: Colors.black12,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          selectedFontSize: 30,
          unselectedFontSize: 18,
          selectedLabelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          unselectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
          ),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: "Home Page",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search Page",
            )
          ]
      ),
    );
  }
}
