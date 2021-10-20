// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields
import 'package:flutter/material.dart';
import '../../coustom/colorScheme.dart';
import '../../studydata/mydata.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  State<Downloads> createState() => _Downloads();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Downloads extends State<Downloads> {
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
    // final TextEditingController query = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloads'),
      ),
      body: Container(
        // clipBehavior: Clip.antiAlias,
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          // borderRadius:
          //     const BorderRadius.vertical(top: Radius.elliptical(200, 60)),
          //
          color: bodycolor,
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              color: bodycolor,
              padding: const EdgeInsets.all(6),
              child: ListView.builder(
                itemBuilder: (context, item) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: FilterChip(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize:
                            Theme.of(context).textTheme.headline3!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.headline3!.fontWeight,
                      ),
                      label: Text(
                        subjects[item],
                      ),
                      onSelected: (value) {
                        setState(() {});
                      },
                    ),
                  );
                },
                itemCount: subjects.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            (downloadList.isEmpty)
                ? Container(
                    child: Image.asset('images/nodownloads.png'),
                    margin: EdgeInsets.only(top: size.height * 0.1),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, item) {
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) async {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                        "Are you sure you want to delete ${downloadList[item]}?"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        onPressed: () {
                                          downloadList.removeAt(item);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          background: Container(
                            color: Colors.red,
                            child: Align(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    " Delete",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          key: Key('$item'),
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 15, bottom: 10),
                              padding: EdgeInsets.all(8),
                              width: size.width * 0.85,
                              decoration: BoxDecoration(
                                  color: cardcolor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      'Ch-1',
                                      style: TextStyle(
                                          fontSize: 25, color: bodycolor),
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 15, right: 5),
                                          child: Text(
                                            downloadList[item].detail,
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
                                          downloadList[item].provider,
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
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 4,
                                            horizontal: 8,
                                          ),
                                          child: Text(
                                            downloadList[item].tag,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: downloadList.length,
                      padding: EdgeInsets.only(top: 00, bottom: 40),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

final downloadList = <MyData>[];
