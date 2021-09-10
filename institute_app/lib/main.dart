import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xff1900FF).withOpacity(0.7), //dark blue
        ),
      ),
      title: 'Institute',
      home: const HomePage(),
    );
  }
}
