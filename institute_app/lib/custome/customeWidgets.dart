// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colorScheme.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: cardcolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      // padding: EdgeInsets.all(8),
      // width: size.width * 0.85,
      // decoration: BoxDecoration(
      //     color: cardcolor, borderRadius: BorderRadius.circular(20)),
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
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Physics',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Electromagnetic Induction',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'By Harry',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Physics',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: cardcolor,
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

Widget customeLeading() {
  return IconButton(
    onPressed: () => Get.back(),
    icon: Icon(Icons.keyboard_arrow_left_rounded),
    color: Colors.white,
  );
}
