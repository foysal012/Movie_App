import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/bottom%20nav%20bar/bottom_navigation_bar_page_screen.dart';
import 'package:movie_app/screen/spalash%20screen/spalash_screen.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //home: SpalashScreen(),
      home: BottomNavigationBarPageScreen(),
    );
  }
}
