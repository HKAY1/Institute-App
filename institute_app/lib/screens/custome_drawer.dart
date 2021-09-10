// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomeDrawer extends StatelessWidget {
  final draweritems = <String>[
    'Study Materials',
    'Calender',
    'Downloads',
    'Chat with Faculty',
    'Invite Friends',
    'Contact Us',
    'F.A.Q\'s',
    'Settings',
    'Log Out',
  ];
  CustomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CircleAvatar(
                maxRadius: 40,
                minRadius: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 15),
              child: Text(
                'data',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.only(left: 30, right: 40),
                  itemBuilder: (context, item) {
                    return ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      title: Text(
                        draweritems[item],
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    );
                  },
                  separatorBuilder: (context, sep) {
                    return Divider(
                      height: 2,
                    );
                  },
                  itemCount: 9),
            ),
          ],
        ),
      ),
      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
    );
  }
}
