// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:imstitute/colorScheme.dart';

import 'drawer/custome_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustomeDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Institute',
          
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Container(
        clipBehavior: Clip.antiAlias,
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.elliptical(200, 60)),
          color: bodycolor,
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          children: [
            Text(
              'Get Ready',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline2!.color,
                  fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: TextField(
                cursorColor: Theme.of(context).backgroundColor,
                style: Theme.of(context).textTheme.headline3,
                decoration: InputDecoration(
                  hintText: ' Type Something',
                  prefixIcon: Icon(Icons.search),
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
              padding: const EdgeInsets.only(top: 20.0, bottom: 20, left: 20),
              child: Text(
                'Live Now',
                style: Theme.of(context).textTheme.headline2,
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
                          margin: EdgeInsets.only(left: 8),
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Physics',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                              Text(
                                'Electromagnetic Induction',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                'By Harry',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Physics',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    onPressed: () {},
                                    child: Text(
                                      'Join',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
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
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, item) {
                return Container(
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
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Physics',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                              Text(
                                'Electromagnetic Induction',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                'By Harry',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Physics',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    onPressed: () {},
                                    child: Text(
                                      'Join',
                                      style: TextStyle(color: Colors.white),
                                    ),
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
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: Text(
                'Our Teachers',
                style: Theme.of(context).textTheme.headline2,
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
    );
  }
}
