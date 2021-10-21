// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teacher_institute/screens/drawer/downloads.dart';
import 'package:teacher_institute/studydata/myinternaldata.dart';
import '../../coustom/colorScheme.dart';

class MyInDataList extends StatefulWidget {
  final List<MyInternalData> mdata;
  MyInDataList({Key? key, required this.mdata}) : super(key: key);

  @override
  State<MyInDataList> createState() => _MyInDataListState();
}

class _MyInDataListState extends State<MyInDataList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      floatingActionButton:FloatingActionButton.extended(onPressed: (){}, label: Text('Upload'),icon: Icon(CupertinoIcons.add),),
      body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: (widget.mdata.isEmpty)
              ? Container(
                  child: Image.asset('images/nodownloads.png'),
                  margin: EdgeInsets.only(top: size.height * 0.1),
                )
              : ListView.builder(
                  itemBuilder: (context, item) {
                    return GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only(top: 15, bottom: 10),
                        padding: EdgeInsets.all(8),
                        width: size.width * 0.85,
                        decoration: BoxDecoration(
                            color: cardcolor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 8, right: 5),
                              child:Text(
                                widget.mdata[item].title,
                                style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline2!
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
                                widget.mdata[item].detail,
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
                            Text(
                              widget.mdata[item].provider,
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
                    );
                  },
                  itemCount: widget.mdata.length,
                  padding:
                      EdgeInsets.only(top: 00, bottom: 40, left: 20, right: 20),
                ),
        ),
    );
  }
}
