import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:imstitute/screens/drawer/calender.dart';
import 'package:imstitute/screens/drawer/custome_drawer.dart';
import 'package:imstitute/screens/drawer/study_material.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/studyMaterial': (context)=> const StudyMaterial(),
        '/calender': (context)=> const Calender(),
        '/default': (context)=> const DefaultPage()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerTheme: DividerThemeData(
          color: const Color(0xff978DFB).withOpacity(0.2),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(
            color: const Color(0xff978DFB).withOpacity(0.5),
          ),
        ),
        textTheme: const TextTheme(
          //for card headline 2
          headline4: TextStyle(
            color: Color(0xff978DFB),
            fontSize: 13,
          ),
          //for card headline 3
          headline5: TextStyle(
            color: Color(0xff978DFB),
            fontSize: 10,
          ),
          //for card headline 1
          headline3: TextStyle(
            color: Color(0xff978DFB),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          //for in body Text theme
          headline2: TextStyle(
            color: Color(0xff978DFB),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        // primaryColor: const Color(0xff1900FF).withOpacity(0.7),
        scaffoldBackgroundColor: const Color(0xff1900FF).withOpacity(0.7),
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          backgroundColor: const Color(0xff1900FF).withOpacity(0.7), //dark blue
        ),
      ),
      title: 'Institute',
      home: const HomePage(),
    );
  }
}
