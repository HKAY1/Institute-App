// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:imstitute/custome/colorScheme.dart';
// import 'package:imstitute/custome/customeWidgets.dart';
import 'package:imstitute/models/study_modals.dart';

class Notes extends StatefulWidget {
  final List<Note> mydata;
  const Notes({Key? key, required this.mydata}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  // final subjects = <String>[
  //   'All Subjects',
  //   'Physics',
  //   'Chemistry',
  //   'Math',
  //   'Biology',
  //   'Physics',
  //   'Chemistry',
  //   'Math',
  //   'Biology',
  //   'Physics',
  //   'Chemistry',
  //   'Math',
  //   'Biology',
  // ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: bodycolor,
        height: size.height,
        width: size.width,
        child: (widget.mydata.isEmpty)
            ? Container(
                child: Image.asset('images/nodownloads.png'),
                margin: EdgeInsets.only(top: size.height * 0.1),
              )
            : ListView.builder(
                itemBuilder: (context, item) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InNotes(
                              data: widget.mydata[item].data ?? [],
                            )));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 15, bottom: 10),
                    padding: EdgeInsets.all(8),
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                        color: cardcolor,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                itemCount: widget.mydata.length,
              ));
  }
}

class InNotes extends StatefulWidget {
  final List<Assignment>? data;
  const InNotes({Key? key, required this.data}) : super(key: key);

  @override
  _InNotesState createState() => _InNotesState();
}

class _InNotesState extends State<InNotes> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: (widget.data!.isEmpty)
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
                                widget.data![item].topic ?? 'No data',
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
                              widget.data![item].file ?? 'No File',
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
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Container(
                            //       decoration: BoxDecoration(
                            //         color: Colors.white.withOpacity(0.6),
                            //         borderRadius: BorderRadius.circular(30),
                            //       ),
                            //       padding: EdgeInsets.symmetric(
                            //         vertical: 4,
                            //         horizontal: 8,
                            //       ),
                            //       child: Text(
                            //         widget.mydata[item].tag,
                            //         style: TextStyle(
                            //           fontSize: Theme.of(context)
                            //               .textTheme
                            //               .headline5!
                            //               .fontSize,
                            //           fontWeight: Theme.of(context)
                            //               .textTheme
                            //               .headline5!
                            //               .fontWeight,
                            //           color: bodycolor,
                            //         ),
                            //       ),
                            //     ),
                            //     IconButton(
                            //       onPressed: () {
                            //         // downloadList.add(widget.mydata[item]);
                            //       },
                            //       icon: Icon(
                            //         Icons.download,
                            //         color: Colors.white,
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: widget.data!.length,
              padding:
                  EdgeInsets.only(top: 00, bottom: 40, left: 20, right: 20),
            ),
    );
  }
}
