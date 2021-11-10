// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../custome/colorScheme.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PerformancePage extends StatelessWidget {
  const PerformancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Performance'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  CircleAvatar(
                    maxRadius: 45,
                    minRadius: 20,
                    backgroundImage:
                        Image.asset('images/monkey_profile.jpg').image,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Ravi',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Total',
                              style: Theme.of(context).textTheme.headline2),
                          Text('Score',
                              style: Theme.of(context).textTheme.headline2),
                          SizedBox(
                            height: 10,
                          ),
                          CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 5.0,
                            percent: 0.7,
                            animation: true,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text("70%",
                                style: Theme.of(context).textTheme.headline3),
                            progressColor: cardcolor,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text('Total',
                              style: Theme.of(context).textTheme.headline2),
                          Text('Attendence',
                              style: Theme.of(context).textTheme.headline2),
                          SizedBox(
                            height: 10,
                          ),
                          CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 5.0,
                            percent: 0.7,
                            animation: true,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text("70%",
                                style: Theme.of(context).textTheme.headline3),
                            progressColor: cardcolor,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: cardcolor,
                ),
                padding: EdgeInsets.symmetric(vertical: 20),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chemistry',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline2!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.headline2!.fontWeight,
                        color: bodycolor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Marks',
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .fontWeight,
                                color: bodycolor,
                              ),
                            ),
                            Text(
                              '60/100',
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .fontWeight,
                                color: bodycolor,
                              ),
                            ),
                          ],
                        ),
                        CircularPercentIndicator(
                          backgroundColor: cardcolor,
                          radius: 60.0,
                          lineWidth: 5.0,
                          percent: 0.7,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            "70%",
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontWeight,
                              color: bodycolor,
                            ),
                          ),
                          progressColor: Colors.cyanAccent,
                        ),
                        Column(
                          children: [
                            Text(
                              '          CGPA',
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .fontWeight,
                                color: bodycolor,
                              ),
                            ),
                            Text(
                              '           6.8',
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .fontWeight,
                                color: bodycolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
