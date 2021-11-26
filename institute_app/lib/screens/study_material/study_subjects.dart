import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imstitute/controller/study_material_controller.dart';
import 'package:imstitute/controller/subject_controller.dart';
import 'package:imstitute/custome/colorScheme.dart';
import 'package:imstitute/custome/customeWidgets.dart';
import 'package:imstitute/models/study_modals.dart';
import '../../mydata.dart';
import 'package:intl/intl.dart';
import 'assignment_page.dart';

class SubjectMaterial extends StatefulWidget {
  const SubjectMaterial({Key? key}) : super(key: key);

  @override
  State<SubjectMaterial> createState() => _SubjectMaterialState();
}

class _SubjectMaterialState extends State<SubjectMaterial> {
  var cont = Get.put(StudyController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Get.arguments ?? 'subject'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 5),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                // dragStartBehavior: DragStartBehavior.down,
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
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  GetBuilder<SubjectController>(
                    init: SubjectController(Get.arguments),
                    builder: (cont) {
                      if (cont.loadingNote.value) {
                        return const Center(
                            child: CustomeLoading(
                          color: Colors.blueAccent,
                        ));
                      }
                      return chapterCard(cont.notes);
                    },
                  ),
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

  Widget chapterCard(List<Notes> notelist) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      itemCount: notelist.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 4 : 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (context, item) {
        return GestureDetector(
          onTap: () => Get.toNamed('/inchapter', arguments: {
            "chapterId": notelist[item].chapterid,
            "chapter": notelist[item].chapterName,
          }),
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
                      Row(
                        // mainAxisSize: ,
                        children: [
                          Text(
                            notelist[item].chapterName,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: bodycolor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -10,
                right: -5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  // (left: 8, right: 5, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xff75e6da), width: 4),
                  ),
                  child: Text(
                    NumberFormat('00').format(notelist[item].chapterNo),
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 30,
                          color: const Color(0xff05445e),
                        ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
