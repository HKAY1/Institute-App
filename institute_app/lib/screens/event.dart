// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imstitute/controller/eventController.dart';
import 'package:imstitute/models/eventModals.dart';
import 'package:imstitute/screens/drawer/faq.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../custome/colorScheme.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  EventController control = Get.put(EventController());
  CalendarFormat format = CalendarFormat.month;
  DateTime focusday = DateTime.now();
  String eventkey =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .millisecondsSinceEpoch
          .toString();
  DateTime selecteday = DateTime.now();
  var events = <MyEvent>[];

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        centerTitle: true,
      ),
      body: GetX<EventController>(builder: (cont) {
        if (control.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin:
                    EdgeInsets.only(top: 28, left: 24, right: 24, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TableCalendar(
                    eventLoader: (date) {
                      var formate = DateTime(date.year, date.month, date.day);
                      return cont.eventList[
                              formate.millisecondsSinceEpoch.toString()] ??
                          [];
                    },
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    firstDay: DateTime.now(),
                    lastDay: DateTime(
                        DateTime.now().year, DateTime.now().month + 2, 0),
                    focusedDay: focusday,
                    formatAnimationDuration: Duration(milliseconds: 300),
                    pageAnimationDuration: Duration(milliseconds: 300),
                    selectedDayPredicate: (d) {
                      return isSameDay(selecteday, d);
                    },
                    onDaySelected: (focus, select) {
                      setState(() {
                        focusday = focus;
                        selecteday = select;
                        eventkey =
                            DateTime(select.year, select.month, select.day)
                                .millisecondsSinceEpoch
                                .toString();
                      });
                    },
                    calendarFormat: format,
                    onFormatChanged: (CalendarFormat _format) {
                      setState(
                        () {
                          format = _format;
                        },
                      );
                    },
                    weekendDays: const [7],
                    headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        leftChevronIcon: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          color: Colors.white,
                        ),
                        rightChevronIcon: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          color: cardcolor,
                        ),
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        formatButtonVisible: false),
                    pageAnimationEnabled: true,
                    calendarBuilders:
                        CalendarBuilders(markerBuilder: (_, date, list) {
                      if (list.isNotEmpty) {
                        return Positioned(
                          right: 6,
                          top: 0,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.redAccent,
                            ),
                            child: Text(
                              "${list.length}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    }),
                    calendarStyle: CalendarStyle(
                      disabledDecoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.black45,
                            offset: Offset(-1, -1),
                          )
                        ],
                      ),
                      defaultDecoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.black45,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      todayTextStyle: TextStyle(color: Colors.white),
                      todayDecoration: BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.green,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      isTodayHighlighted: true,
                      weekendDecoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.black45,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      weekendTextStyle: TextStyle(color: Colors.redAccent),
                      selectedTextStyle: TextStyle(color: Colors.white),
                      selectedDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.blue,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (cont.eventList.containsKey(eventkey))
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
                        expandedHeaderPadding:
                            EdgeInsets.only(bottom: 3, top: 3),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      '9 NOV',
                                      style: TextStyle(
                                          fontSize: 25, color: bodycolor),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 15, right: 5),
                                        child: Text(
                                          cont.eventList[eventkey]![item]
                                                  .name ??
                                              'no data',
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
                                          'End Date ${DateFormat('EEE, MMM d').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                cont.eventList[eventkey]![item]
                                                    .endDate),
                                          )}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        Text(
                                          'From ${cont.eventList[eventkey]![item].startTime}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      cont.eventList[eventkey]![item]
                                              .discription ??
                                          'No Data',
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
                  childCount: cont.eventList[eventkey]!.length,
                ),
              ),
            SliverToBoxAdapter(
              child: SizedBox(height: 30),
            )
          ],
        );
      }),
    );
  }
}
