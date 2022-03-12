// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:get/get.dart';
import 'package:edeazy_teacher/controller/authorisation_controller.dart';
import 'package:edeazy_teacher/screens/event.dart';
import 'package:edeazy_teacher/screens/study_material/classes_page.dart';
import 'screens/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var c = Get.put(AuthrisationController());
  @override
  void initState() {
    super.initState();
    c.refreshProfile();
  }

  int _myindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: FancyBottomNavigation(
            textColor: Colors.white,
            circleColor: Colors.white,
            activeIconColor: Colors.blue,
            inactiveIconColor: Colors.white,
            barBackgroundColor: Colors.blue,
            tabs: [
              TabData(iconData: Icons.home, title: "Home"),
              TabData(iconData: Icons.calendar_today_rounded, title: "Events"),
              TabData(
                  iconData: Icons.menu_book_outlined, title: "Study Mayerial")
            ],
            onTabChangedListener: (i) {
              setState(() {
                _myindex = i;
              });
            }),
        body: IndexedStack(
          children :mylist,
          index:_myindex,
        )
      ),
    );
  }
}

final mylist = <Widget>[
  Home(),
  Calender(),
  StudyMaterial(),
];
