// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:imstitute/colorScheme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text('Institute'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Stack(children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [backstart, backend],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter)),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.vertical(top: Radius.elliptical(200, 60)),
            color: bodycolor,
          ),
          child: ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            children: [
              Text(
                'Get Ready',
                textAlign: TextAlign.center,
                style: TextStyle(color: headlinetext, fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Try Something',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, i, j) {
                  return Container(
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      '$i',
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                },
                options: CarouselOptions(
                    aspectRatio: 7 / 2,
                    viewportFraction: 1,
                    autoPlay: true,
                    enableInfiniteScroll: true),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Text(
                  'Live Now',
                  style: TextStyle(color: headlinetext, fontSize: 15),
                ),
              ),
              CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, i, j) {
                  return Container(
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                        color: cardcolor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                              minRadius: 40,
                              maxRadius: 50,
                              backgroundColor: Colors.white,
                            ),
                            Positioned(
                                right: 10,
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    'Live',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                ))
                          ],
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Physics'),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.hearing))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                    aspectRatio: 6 / 2,
                    viewportFraction: 1,
                    autoPlay: true,
                    enableInfiniteScroll: true),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: Text(
                  'Upcomming Lectures',
                  style: TextStyle(color: headlinetext, fontSize: 15),
                ),
              ),
              Flexible(
                  child: Column(
                children: [
                  for (var i = 0; i < 3; i++)
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      padding: EdgeInsets.all(8),
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                          color: cardcolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            minRadius: 40,
                            maxRadius: 50,
                            backgroundColor: Colors.white,
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(left: 8),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Physics'),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.hearing))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Text(
                  'Our Teachers',
                  style: TextStyle(color: headlinetext, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            maxRadius: 35,
                          ),
                          Text(
                            'Harsh Sir',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
