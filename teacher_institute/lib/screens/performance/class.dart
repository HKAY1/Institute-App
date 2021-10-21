// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_institute/coustom/colorScheme.dart';

class ChooseClass extends StatefulWidget {
  const ChooseClass({ Key? key }) : super(key: key);

  @override
  State<ChooseClass> createState() => _ChooseClassState();
}

class _ChooseClassState extends State<ChooseClass> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Performance'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Text('Select Class',style: Theme.of(context).textTheme.headline2,),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context,item){
                return  GestureDetector(
                  onTap: (){
                   Get.toNamed('/student');
                },
                  child: Container(
                                  margin: EdgeInsets.only(top: 15, bottom: 10),
                                  padding: EdgeInsets.all(15),
                                  width: size.width * 0.85,
                                  decoration: BoxDecoration(
                                      color: cardcolor,
                                      borderRadius: BorderRadius.circular(30)),
                                  child:Text('Class IX',
                                  style: TextStyle(
                                    fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                                    color: Colors.white,
                                  ),
                                  ),
                                  ),
                );
              },
              itemCount: 5,
               padding: EdgeInsets.only(top: 00, bottom: 40, left: 20, right: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}