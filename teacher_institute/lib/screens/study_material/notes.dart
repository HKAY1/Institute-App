// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:teacher_institute/screens/drawer/downloads.dart';

import '../../coustom/colorScheme.dart';
import '../../mydata.dart';

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
    return Container(
      // clipBehavior: Clip.antiAlias,
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        // borderRadius:
        //     const BorderRadius.vertical(top: Radius.elliptical(200, 60)),
        //
        color: bodycolor,
      ),
      child: (widget.mydata.isEmpty)
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
                      color: cardcolor,
                      borderRadius: BorderRadius.circular(30)),
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
              padding:
                  EdgeInsets.only(top: 00, bottom: 40, left: 20, right: 20),
            ),
    );
  }
}


// PreferredSize(
//             preferredSize: Size(size.width, 50),
//             child: Container(
//               color: bodycolor,
//               padding: const EdgeInsets.all(6),
//               child: ListView.builder(
//                 itemBuilder: (context, item) {
//                   return Padding(
//                     padding: const EdgeInsets.only(left: 5.0, right: 5),
//                     child: FilterChip(
//                       backgroundColor:
//                           Theme.of(context).scaffoldBackgroundColor,
//                       labelStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize:
//                             Theme.of(context).textTheme.headline3!.fontSize,
//                         fontWeight:
//                             Theme.of(context).textTheme.headline3!.fontWeight,
//                       ),
//                       label: Text(
//                         subjects[item],
//                       ),
//                       onSelected: (value) {
//                         setState(() {});
//                       },
//                     ),
//                   );
//                 },
//                 itemCount: subjects.length,
//                 scrollDirection: Axis.horizontal,
//               ),
//             ),
//           ),