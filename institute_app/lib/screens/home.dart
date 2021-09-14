// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:imstitute/colorScheme.dart';

import '../customeCard.dart';
import 'drawer/custome_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustomeDrawer(),
      appBar: AppBar(
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
                return MyCard();
              },
              options: CarouselOptions(
                  aspectRatio: 5 / 2,
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
                return MyCard();
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
