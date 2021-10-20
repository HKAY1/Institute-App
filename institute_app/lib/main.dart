import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:imstitute/login_page.dart';
import 'package:imstitute/screens/drawer/contactUSPage.dart';
import 'package:imstitute/screens/drawer/custome_drawer.dart';
import 'package:imstitute/screens/drawer/bookmark.dart';
import 'package:imstitute/screens/drawer/faq.dart';
import 'package:imstitute/screens/drawer/profile_Page.dart';
import 'package:imstitute/screens/notification.dart';
import 'homepage.dart';

import 'screens/performance.dart';
import 'screens/study_material/study_material.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/homepage', page: () => const HomePage()),
        GetPage(name: '/profile', page: () => const ProfilePage()),
        GetPage(name: '/notification', page: () => const NotificatioPage()),
        GetPage(name: '/contactus', page: () => const ContactUs()),
        GetPage(name: '/performance', page: () => const PerformancePage()),
        GetPage(name: '/default', page: () => const DefaultPage()),
        GetPage(name: '/downloads', page: () => const Bookmark()),
        GetPage(name: '/faq', page: () => const FAQPage()),
        GetPage(name: '/study', page: () => const StudyChapters()),
        GetPage(name: '/login', page: () => const LoginPage()),
      ],
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
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
          headline1: TextStyle(
            // color: Colors.white,
            fontSize: 60,
          ),
          //for card headline 2
          headline4: TextStyle(
            // color: Color(0xff978DFB),
            fontSize: 13,
          ),
          //for card headline 3
          headline5: TextStyle(
            // color: Color(0xff978DFB),
            fontSize: 10,
          ),
          //for card headline 1
          headline3: TextStyle(
            // color: Color(0xff978DFB),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          //for in body Text theme
          headline2: TextStyle(
            // color: Color(0xff978DFB),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // primaryColor: const Color(0xff1900FF).withOpacity(0.7),
        // const Color(0xff02d5fa)
        scaffoldBackgroundColor: const Color(0xffd4f5f0).withOpacity(0.2),
        appBarTheme: const AppBarTheme(
          // toolbarHeight: 10,
          shape: MyShapeBorder(10),
          // ContinuousRectangleBorder(
          //     borderRadius:
          //         BorderRadius.vertical(bottom: Radius.circular(5000))),

          iconTheme: IconThemeData(color: Colors.blue),
          actionsIconTheme: IconThemeData(color: Colors.blue),
          centerTitle: true,
          elevation: 20,
          titleTextStyle: TextStyle(
            shadows: [
              Shadow(color: Colors.blue, blurRadius: 3, offset: Offset(2, 2))
            ],
            color: Colors.blue,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          backgroundColor: Colors.white, //dark blue
        ),
      ),
      title: 'Institute',
      home: const LoginPage(),
    );
  }
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder(this.curveHeight);
  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 4,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}
