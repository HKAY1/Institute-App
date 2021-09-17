// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../../../colorScheme.dart';

class Notes extends StatefulWidget {
  final bool isEMpty;
  Notes({Key? key, required this.isEMpty}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
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
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: Container(
          color: bodycolor,
          padding: const EdgeInsets.all(6),
          child: ListView.builder(
            itemBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5),
                child: FilterChip(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.headline3!.fontSize,
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
        child: (widget.isEMpty)
            ? Container(
                margin: EdgeInsets.only(top: size.height * 0.1),
                child: Image.asset('images/nodownloads.png'),
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
                                  'Electromagnetic Induction cbhgdvchb wdhcbjhwec jhvwchjvce ejhvwhbcew wghcvhg whgcv w hgvwc hcvw',
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
                                'By Harry',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Full Chapter PDF',
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
                                  IconButton(
                                    onPressed: () {},
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
                itemCount: 10,
                padding:
                    EdgeInsets.only(top: 00, bottom: 40, left: 20, right: 20),
              ),
      ),
    );
  }
}
