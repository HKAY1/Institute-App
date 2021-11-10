// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_institute/coustom/colorScheme.dart';
import 'package:teacher_institute/studydata/mydata.dart';
import 'notes.dart';

class StudyMaterial extends StatefulWidget {
  StudyMaterial({Key? key}) : super(key: key);

  @override
  State<StudyMaterial> createState() => _StudyMaterial();
}

class _StudyMaterial extends State<StudyMaterial> {
  late ScrollController controll;
  final controller = TextEditingController();
  String? selected = 'all';
   var las =<Subject>[
    Subject(
      clas: 5,
       subj:['English','Hindi']
    ),
    Subject(
      clas: 6,
       subj:['Math','Science']
    ),Subject(
      clas: 7,
       subj:['SST','Hindi']
    ),Subject(
      clas: 8,
       subj:['GK','Eng']
    ),Subject(
      clas: 9,
       subj:['English','Hindi']
    ),Subject(
      clas: 10,
       subj:['Math','arys']
    ),

    
  ];
  
  @override
  void initState() {
    super.initState();
    controll = ScrollController();
  }
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = las.isEmpty ? styleHint : styleActive;
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (int s){
              setState(() {
                selected = s as String? ;
               
              });
            },
            itemBuilder: (_){
              return las.map((e) {
                return PopupMenuItem(
                  value:  las.length,
                  child: Text('${las[e.clas].clas}')
                  );
              }
              ).toList();
            },
          )
          
        ],
        title: Text('Subjects'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: CustomScrollView(
          controller: controll,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    
                    Container(
                          height: 42,
                          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            border: Border.all(color: Colors.black26),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                    icon: Icon(Icons.search, color: style.color),
                    suffixIcon:las.isNotEmpty
                        ? GestureDetector(
                            child: Icon(Icons.close, color: style.color),
                            onTap: () {
                              controller.clear();
                              // widget.onChanged('');
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        : null,
                    hintText: 'Search your class',
                    hintStyle: style,
                    border: InputBorder.none,
                            ),
                            style: style,
                            // onChanged: widget.onChanged,
                          ),
                            ),
                  ],
                ),
              ),
              SliverList(
                delegate:SliverChildBuilderDelegate(
                  (context, item) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
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
                                las[item].subj[0],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight:
                                      Theme.of(context).textTheme.headline2!.fontWeight,
                                  color: bodycolor,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                               'Class ${las[item].clas}th',
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
                      ),
                  );
                },
                childCount: las.length,
                ) ,
              ),
            ],
        ),
      ),
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
          floatingActionButton:FloatingActionButton.extended(onPressed: (){
           Get.toNamed('/material');
        }, label: Text('Upload'),icon: Icon(CupertinoIcons.add),),
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


class Subject{
  int clas;
  List<String> subj;
  Subject( {this.clas = 2,this.subj = const ['default','default','default']});
}
