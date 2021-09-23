import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:imstitute/screens/drawer/contactUSPage.dart';
import 'package:imstitute/screens/drawer/custome_drawer.dart';
import 'package:imstitute/screens/drawer/downloads.dart';
import 'package:imstitute/screens/drawer/faq.dart';
import 'package:imstitute/screens/drawer/profile_Page.dart';
import 'package:imstitute/screens/notification.dart';
import 'homepage.dart';

import 'screens/performance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/profile': (context) => const ProfilePage(),
        '/notification': (context) => const NotificatioPage(),
        '/contactus': (context) => const ContactUs(),
        '/performance': (context) => const PerformancePage(),
        '/default': (context) => const DefaultPage(),
        '/downloads': (context) => const Downloads(),
        '/faq': (context) => const FAQPage(),
      },
      onGenerateRoute: (setting) {
        if (setting.name == '/profile') {
          return PageRouteBuilder(
            settings:
                setting, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
            pageBuilder: (_, __, ___) => const ProfilePage(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          );
        }
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerTheme: DividerThemeData(
          color: const Color(0xff978DFB).withOpacity(0.2),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff1900FF),
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
        scaffoldBackgroundColor: const Color(0xff1900FF),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          backgroundColor: Color(0xff1900FF), //dark blue
        ),
      ),
      title: 'Institute',
      home: const HomePage(),
    );
  }
}
