// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_institute/coustom/colorScheme.dart';
import 'package:teacher_institute/studydata/mydata.dart';
import 'classes_page.dart';
import 'notes.dart';



class StudyChapters extends StatefulWidget {
  const StudyChapters({Key? key}) : super(key: key);

  @override
  State<StudyChapters> createState() => _StudyChaptersState();
}

class _StudyChaptersState extends State<StudyChapters> {
  List<String> subjects = Get.arguments['subjectList'];
  String clas = Get.arguments['class'];
  String subject = Get.arguments['subjectList'][0];
  final List<String> type = <String>['Notes','Assignment','Test Series'];
  String mat= 'Notes';
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          floatingActionButton:FloatingActionButton.extended(
            onPressed: (){
           Get.toNamed('/material',arguments: {'mat':mat,'class':clas,'subject':subject});
        },
         label: Text('Upload'),
         icon: Icon(CupertinoIcons.add),
         ),
        appBar: AppBar(
          actions: [
             PopupMenuButton(
            onSelected: (String s){
              setState(() {
                subject = s ;
               
              });
            },
            itemBuilder: (_){
              return subjects.map((e) {
                return PopupMenuItem(
                  onTap: (){
                    setState(() {
                      subject =e;
                    });
                  },
                  value:  e,
                  child: Text(e),
                  );
              }
              ).toList();
            },
          )],
          title: Text(subject),
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
                isScrollable: false,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: cardcolor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                onTap: (i){
                  mat = type[i];
                },
                tabs: List.generate(type.length, (i) => Tab(text:type[i]))
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
                        return GestureDetector(
                          onTap: (){
                            Get.toNamed('/innermaterial');
                          },
                          child: Stack(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                  right: -5,
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 5, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xff75e6da), width: 4),
                    ),
                    child: Text(
                      '01',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 30,
                            color: Color(0xff05445e),
                          ),
                    ),
                  ),
                )
                            ],
                          ),
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


