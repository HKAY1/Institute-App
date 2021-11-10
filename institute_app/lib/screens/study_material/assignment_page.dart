// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:imstitute/mydata.dart';
import 'package:imstitute/screens/drawer/bookmark.dart';
import '../../custome/colorScheme.dart';

class MyDataList extends StatefulWidget {
  final List<MyData> mydata;
  MyDataList({Key? key, required this.mydata}) : super(key: key);

  @override
  State<MyDataList> createState() => _MyDataListState();
}

class _MyDataListState extends State<MyDataList> {
  final subjects = <String>[
    'All Subjects',
    'Physics',
    'Chemistry',
    'Math',
    'Biology',
    'Physics',
    'Chemistry',
    'Math',
    'Biology',
    'Physics',
    'Chemistry',
    'Math',
    'Biology',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (widget.mydata.isEmpty)
        ? Container(
            child: Image.asset('images/nodownloads.png'),
            margin: EdgeInsets.only(top: size.height * 0.1),
          )
        : ListView.builder(
            itemBuilder: (context, item) {
              return Container(
                margin: EdgeInsets.only(top: 15, bottom: 10),
                padding: EdgeInsets.all(8),
                width: size.width * 0.85,
                decoration: BoxDecoration(
                    color: cardcolor, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Ch-1',
                        style: TextStyle(fontSize: 25, color: bodycolor),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 15, right: 5),
                            child: Text(
                              widget.mydata[item].detail,
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .fontWeight,
                                color: bodycolor,
                              ),
                            ),
                          ),
                          Text(
                            widget.mydata[item].provider,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                child: Text(
                                  widget.mydata[item].tag,
                                  style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .fontWeight,
                                    color: bodycolor,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  downloadList.add(widget.mydata[item]);
                                },
                                icon: Icon(
                                  Icons.download,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: widget.mydata.length,
            padding: EdgeInsets.only(top: 00, bottom: 40, left: 20, right: 20),
          );
  }
}
