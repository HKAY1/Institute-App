// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';

import 'colorScheme.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // padding: EdgeInsets.all(8),
      width: size.width * 0.85,
      decoration: BoxDecoration(
          color: cardcolor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 8),
          CircleAvatar(
            minRadius: 40,
            maxRadius: 50,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Physics',
                        style: Theme.of(context).textTheme.headline4,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Physics',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
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
  }
}

class MyBackground extends StatelessWidget {
  final Widget child;

  const MyBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: child,
      clipBehavior: Clip.antiAlias,
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.elliptical(200, 60)),
        color: bodycolor,
      ),
    );
  }
}
