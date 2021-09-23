// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:imstitute/customeWidgets.dart';
import 'package:imstitute/screens/drawer/faq.dart';
import 'package:table_calendar/table_calendar.dart';

import '../colorScheme.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarFormat format = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Calender'),
        centerTitle: true,
      ),
      body: MyBackground(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Card(
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.only(
                        top: 28, left: 24, right: 24, bottom: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 5,
                    child: TableCalendar(
                      rowHeight: 35,
                      daysOfWeekHeight: 15,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      calendarFormat: format,
                      onFormatChanged: (CalendarFormat _format) {
                        setState(
                          () {
                            format = _format;
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Upcoming Events',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, item) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 15,
                    margin: EdgeInsets.all(10),
                    child: ExpansionPanelList(
                      dividerColor: Colors.red,
                      expandedHeaderPadding: EdgeInsets.only(bottom: 3, top: 3),
                      animationDuration: Duration(milliseconds: 450),
                      expansionCallback: (i, exp) {
                        setState(() {
                          itemData[item].expanded = !exp;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          backgroundColor: cardcolor,
                          canTapOnHeader: true,
                          isExpanded: itemData[item].expanded,
                          headerBuilder: (context, isex) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    '9 NOV',
                                    style: TextStyle(
                                        fontSize: 25, color: bodycolor),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 15, right: 5),
                                      child: Text(
                                        'PTM Notice',
                                        style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .fontSize,
                                          fontWeight: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .fontWeight,
                                          color: bodycolor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'By Harry',
                                      style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .fontSize,
                                        fontWeight: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .fontWeight,
                                        color: bodycolor,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ],
                            );
                          },
                          body: Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Start time 11pm',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                      Text(
                                        'End time 12pm',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    itemData[item].discription,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  );
                },
                childCount: itemData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<ItemModel> itemData = <ItemModel>[
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
];
