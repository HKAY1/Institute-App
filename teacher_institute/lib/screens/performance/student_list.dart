// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teacher_institute/coustom/colorScheme.dart';

class StudentList extends StatelessWidget {
  const StudentList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Performance'),
        centerTitle:true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:20.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,item) {
            return Card(
              elevation: 8,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  // padding: EdgeInsets.all(8),
                  // width: size.width * 0.85,
                  color: cardcolor,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  // decoration: BoxDecoration(),
                  child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 8),
              CircleAvatar(
                minRadius: 30,
                maxRadius: 40,
                backgroundImage: Image.asset('images/monkey_profile.jpg').image,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ravi Sharma',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Class 9th',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircularPercentIndicator(
                                animationDuration: 800,
                                restartAnimation: true,
                                radius: 35.0,
                                lineWidth: 3.0,
                                percent: 0.7,
                                animation: true,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Text("70%",
                                    style: Theme.of(context).textTheme.headline5),
                                progressColor:
                                    Colors.blue,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text('Total Score',
                                  style: Theme.of(context).textTheme.headline5),
                            ],
                          ),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 35.0,
                                lineWidth: 3.0,
                                percent: 0.7,
                                animation: true,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Text("70%",
                                    style: Theme.of(context).textTheme.headline5),
                                progressColor:
                                    Colors.blue,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text('Total Attendence',
                                  style: Theme.of(context).textTheme.headline5),
                            ],
                          ),
                          Column(
                            children:[
                              Text('60/100',
                                  style: Theme.of(context).textTheme.headline5),
                                  
                              SizedBox(
                                height: 5,
                              ),
                              Text('Total Marks',
                                  style: Theme.of(context).textTheme.headline5),
                            ]
                          ),
                          Column(
                            children:[
                              Text('6.9',
                                  style: Theme.of(context).textTheme.headline5),
                                  
                              SizedBox(
                                height: 3,
                              ),
                              Text('total CGPA',
                                  style: Theme.of(context).textTheme.headline5),
                            ]
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
                  ),
              );
          }
        ),
      ),
    );
  }
}