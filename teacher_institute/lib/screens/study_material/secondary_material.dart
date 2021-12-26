// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_institute/coustom/colorScheme.dart';
import 'package:teacher_institute/modals/teacher_studymodal.dart';

class SecondaryMaterial extends StatefulWidget {
  final List<SecondaryMatModal> data;
  SecondaryMaterial({Key? key, required this.data}) : super(key: key);

  @override
  State<SecondaryMaterial> createState() => _MyInDataListState();
}

class _MyInDataListState extends State<SecondaryMaterial> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, item) {
        return GestureDetector(
          onTap: () {
            Get.toNamed('pdfView', arguments: widget.data[item].file);
          },
          child: Container(
            margin: EdgeInsets.only(top: 15, bottom: 10),
            padding: EdgeInsets.all(8),
            width: size.width * 0.85,
            decoration: BoxDecoration(
                color: cardcolor, borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 5),
                  child: Text(
                    widget.data[item].topic,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.headline3!.fontWeight,
                      color: bodycolor,
                    ),
                  ),
                ),
                Text(
                  'Tera Baap',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline3!.fontSize,
                    fontWeight:
                        Theme.of(context).textTheme.headline3!.fontWeight,
                    color: bodycolor,
                  ),
                ),
                Text(
                  'ravi',
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
      itemCount: widget.data.length,
      padding: EdgeInsets.only(top: 00, bottom: 40, left: 20, right: 20),
    );
  }
}
