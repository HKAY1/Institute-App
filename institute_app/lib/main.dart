import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imstitute/login_page.dart';
import 'package:imstitute/screens/drawer/contactUSPage.dart';
import 'package:imstitute/screens/drawer/custome_drawer.dart';
import 'package:imstitute/screens/drawer/bookmark.dart';
import 'package:imstitute/screens/drawer/faq.dart';
import 'package:imstitute/screens/drawer/profile_page.dart';
import 'package:imstitute/screens/notification.dart';
import 'package:imstitute/screens/study_material/notes_page.dart';
import 'bindings.dart';
import 'homepage.dart';
import 'screens/drawer/performance.dart';
import 'screens/study_material/study_subjects.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      getPages: [
        GetPage(
          name: '/homepage',
          page: () => const HomePage(),
        ),
        GetPage(name: '/profile', page: () => const ProfilePage()),
        GetPage(name: '/notification', page: () => const NotificatioPage()),
        GetPage(name: '/contactus', page: () => const ContactUs()),
        GetPage(name: '/performance', page: () => const PerformancePage()),
        GetPage(name: '/default', page: () => const DefaultPage()),
        GetPage(name: '/downloads', page: () => const Bookmark()),
        GetPage(name: '/faq', page: () => const FAQPage()),
        GetPage(name: '/study', page: () => const SubjectMaterial()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/inchapter', page: () => const InChapter()),
      ],
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        primaryColor: Colors.white,
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
            color: Colors.black,
            fontSize: 60,
          ),
          //for card headline 2
          headline4: TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
          //for card headline 3
          headline5: TextStyle(
            color: Colors.black,
            fontSize: 10,
          ),
          //for card headline 1
          headline3: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          //for in body Text theme
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          shape: MyShapeBorder(10),
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          elevation: 20,
          titleTextStyle: TextStyle(
            shadows: [
              Shadow(color: Colors.grey, blurRadius: 3, offset: Offset(2, 2))
            ],
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          backgroundColor: Colors.blue, //dark blue
        ),
      ),
      title: 'Institute',
      home: (go()) ? const HomePage() : const LoginPage(),
      // FutureBuilder(
      //   builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: Text('Please wait its loading...'));
      //     } else {
      //       if (snapshot.data ?? false) return const HomePage();
      //       return const LoginPage();
      //     }
      //   },
      //   future: go(),
      // ),
    );
  }

  bool go() {
    final g = GetStorage();
    String d = g.read('token') ?? '';
    bool data = d.isNotEmpty;
    return data;
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
