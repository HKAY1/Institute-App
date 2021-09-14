// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../colorScheme.dart';

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
      body: Container(
        clipBehavior: Clip.antiAlias,
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.elliptical(200, 60)),
          color: bodycolor,
        ),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.only(top: 28, left: 24, right: 24, bottom: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              elevation: 5,
              child: TableCalendar(
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
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, item) {
                  return Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    padding: EdgeInsets.all(8),
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                        color: cardcolor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text(
                            '9 NOV',
                            style: TextStyle(fontSize: 25, color: bodycolor),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 15, right: 5),
                                    child: Text(
                                      'Electromagnetic',
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
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
                padding: EdgeInsets.all(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
