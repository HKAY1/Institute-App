// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:teacher_institute/screens/addevent.dart';

import '../coustom/colorScheme.dart';
import '../coustom/customeWidgets.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
   bool isVisible = true;
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
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification){
            if(notification.direction == ScrollDirection.forward){
             if(!isVisible) {setState(() {
                isVisible = true;
              });}
            }
            else if(notification.direction == ScrollDirection.reverse){
              
            if(isVisible) {
               setState(() {
                isVisible = false;
              });}
            }
            return true;
          },
          child: Stack(
            children: [
              CustomScrollView(
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
                                eventData[item].expanded = !exp;
                              });
                            },
                            children: [
                              ExpansionPanel(
                                backgroundColor: cardcolor,
                                canTapOnHeader: true,
                                isExpanded: eventData[item].expanded,
                                headerBuilder: (context, isex) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        child: Text(
                                          eventData[item].startDate,
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
                                              eventData[item].heading,
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
                                          // Text(
                                          //  'By ${eventData[item].provider}',
                                          //   style: TextStyle(
                                          //     fontSize: Theme.of(context)
                                          //         .textTheme
                                          //         .headline4!
                                          //         .fontSize,
                                          //     fontWeight: Theme.of(context)
                                          //         .textTheme
                                          //         .headline4!
                                          //         .fontWeight,
                                          //     color: bodycolor,
                                          //   ),
                                          // ),
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
                                             'End Date -${eventData[item].headerItem1}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                            Text(
                                             'Timings - ${eventData[item].headerItem2}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          eventData[item].discription,
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
                      childCount: eventData.length,
                    ),
                  ),
                ],
              ),
              // Align(
              //   alignment: Alignment.bottomRight,
                
              //   child: 
              // )
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
                  maintainAnimation: false,
                  visible: isVisible,
                  child: FloatingActionButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>AddEvent() ),);
                  },
                child: Icon(Icons.add),
                )),
    );
  }
}

final List<EventData> eventData = <EventData>[
  EventData(
    startDate: '9 NOV',
    heading: 'PTM Notice',
    // provider: 'Harry',
    headerItem2: ' 8pm to 10pm',
    headerItem1: '   10NOV',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  EventData(
    startDate: '9 NOV',
    heading: 'PTM Notice',
    // provider: 'Harry',
    headerItem2: ' 8pm to 10pm',
    headerItem1: '   10NOV',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  EventData(
    startDate: '9 NOV',
    heading: 'PTM Notice',
    // provider: 'Harry',
    headerItem2: ' 8pm to 10pm',
    headerItem1: '   10NOV',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  EventData(
    startDate: '9 NOV',
    heading: 'PTM Notice',
    // provider: 'Harry',
    headerItem2: ' 8pm to 10pm',
    headerItem1: '   10NOV',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  EventData(
    startDate: '9 NOV',
    heading: 'PTM Notice',
    // provider: 'Harry',
    headerItem2: ' 8pm to 10pm',
    headerItem1: '   10NOV',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
];


class EventData {
  bool expanded;
  final String headerItem1;
  final String startDate;
  final String heading;
  // final String provider;
  final String headerItem2;
  final String discription;
  final Color colorsItem;
  // String img;

  EventData(
      {this.expanded = false,
      required this.heading,
      required this.startDate,
      // required this.provider,
      required this.headerItem1,
      required this.headerItem2,
      required this.discription,
      required this.colorsItem});
}