// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imstitute/custome/colorScheme.dart';

import '../../mydata.dart';
import 'notes.dart';

class StudyMaterial extends StatefulWidget {
  final subjects = <String>[
    'Physics',
    'Chemistry',
    'Biology',
    'Mathmetics',
    'English',
    'Hindi',
    'Computer Science',
  ];
  StudyMaterial({Key? key}) : super(key: key);

  @override
  State<StudyMaterial> createState() => _StudyMaterial();
}

class _StudyMaterial extends State<StudyMaterial> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
        itemBuilder: (context, item) {
          return GestureDetector(
            onTap: () {
              Get.toNamed('/study');
            },
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: cardcolor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.subjects[item],
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight:
                          Theme.of(context).textTheme.headline2!.fontWeight,
                      color: bodycolor,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Flopin Sir',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.headline4!.fontWeight,
                      color: bodycolor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: widget.subjects.length,
      ),
    );
  }
}

class ChapterPage extends StatefulWidget {
  final String subj;
  ChapterPage({Key? key, required this.subj}) : super(key: key);

  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subj),
      ),
      body: GridView.builder(
          // clipBehavior: Clip.none,
          padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 10),
          itemCount: 23,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 4
                    : 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, item) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: cardcolor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chapter',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: bodycolor),
                        ),
                        Text(
                          'sdccsjdcvhj sjcbjs asdvc shcvhsdcv gacvhag',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: bodycolor),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -10,
                  left: -5,
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 5, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xff75e6da), width: 4),
                    ),
                    child: Text(
                      '21',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 50,
                            color: Color(0xff05445e),
                          ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}

class StudyChapters extends StatelessWidget {
  const StudyChapters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Study Material'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 30, 20, 5),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                dragStartBehavior: DragStartBehavior.down,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: cardcolor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'Notes',
                  ),
                  Tab(
                    text: 'Assignment',
                  ),
                  Tab(
                    text: 'Text Series',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  GridView.builder(
                      // clipBehavior: Clip.none,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      itemCount: 23,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 4
                            : 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 3 / 2,
                      ),
                      itemBuilder: (context, item) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: cardcolor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Chapter',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(color: bodycolor),
                                    ),
                                    Text(
                                      'sdccsjdcvhj sjcbjs asdvc shcvhsdcv gacvhag',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(color: bodycolor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: -10,
                              left: -5,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 5, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xff75e6da), width: 4),
                                ),
                                child: Text(
                                  '21',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                        fontSize: 50,
                                        color: Color(0xff05445e),
                                      ),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                  MyDataList(
                    mydata: assignment,
                  ),
                  MyDataList(
                    mydata: testseries,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
