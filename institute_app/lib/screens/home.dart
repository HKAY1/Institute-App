// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:imstitute/colorScheme.dart';

import '../custome/customeWidgets.dart';
import 'drawer/custome_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustomeDrawer(),
      appBar: AppBar(
        title: Text(
          'Institute',
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 20),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notification');
                },
                icon: Icon(Icons.notifications)),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     'Get Ready',
                  //     style: TextStyle(
                  //       color: Theme.of(context).textTheme.headline2!.color,
                  //       fontSize: 25,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 30),
                  // CarouselSlider.builder(
                  //   itemCount: 3,
                  //   itemBuilder: (context, i, j) {
                  //     return Container(
                  //       width: size.width * 0.8,
                  //       decoration: BoxDecoration(
                  //           color: Colors.amber,
                  //           borderRadius: BorderRadius.circular(20)),
                  //       child: Text(
                  //         '$i',
                  //         style: TextStyle(fontSize: 30),
                  //       ),
                  //     );
                  //   },
                  //   options: CarouselOptions(
                  //       aspectRatio: 7 / 2,
                  //       viewportFraction: 1,
                  //       autoPlay: true,
                  //       enableInfiniteScroll: true),
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, bottom: 20, left: 20),
                    child: Text(
                      'Live Now',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.red),
                    ),
                  ),
                  MyCard(),
                  // CarouselSlider.builder(
                  //   itemCount: 3,
                  //   itemBuilder: (context, i, j) {
                  //     return ;
                  //   },
                  //   options: CarouselOptions(
                  //       aspectRatio: 7 / 3.55,
                  //       viewportFraction: 1,
                  //       autoPlay: true,
                  //       enableInfiniteScroll: true),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                    child: Text(
                      'Upcomming Lectures',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, item) {
                return MyCard();
              },
              childCount: 3,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Text(
                      'Our Teachers',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundImage: Image.asset(
                                  'images/monkey_profile.jpg',
                                  fit: BoxFit.fitHeight,
                                ).image,
                                maxRadius: 35,
                              ),
                              Text(
                                'Ravi bhai',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
