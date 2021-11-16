import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imstitute/custome/colorScheme.dart';
import '../../mydata.dart';
import 'assignment_page.dart';
import 'notes_page.dart';

class SubjectMaterial extends StatelessWidget {
  const SubjectMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Get.arguments ?? 'Subject'),
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
                  const Notes(),
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
