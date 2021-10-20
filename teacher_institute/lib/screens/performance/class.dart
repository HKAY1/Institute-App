// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:teacher_institute/coustom/colorScheme.dart';
import 'package:teacher_institute/coustom/customeWidgets.dart';
import 'package:teacher_institute/screens/performance/student_list.dart';

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
      body: MyBackground(child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Text('Select Class',style: Theme.of(context).textTheme.headline2,),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context,item){
                return  GestureDetector(
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentList() ),);
                },
                  child: Container(
                                  margin: EdgeInsets.only(top: 15, bottom: 10),
                                  padding: EdgeInsets.all(8),
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
      ),
    );
  }
}