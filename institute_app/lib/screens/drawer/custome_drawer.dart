// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DrawerItems {
  final String title;
  final IconData icon;
  DrawerItems({this.title = 'Error', this.icon = Icons.error});
}

class CustomeDrawer extends StatelessWidget {
  final draweritems = [
    DrawerItems(title: 'Performance', icon: Icons.insights_rounded),
    DrawerItems(title: 'Calender', icon: Icons.calendar_view_month_rounded),
    DrawerItems(title: 'Downloads', icon: Icons.download),
    DrawerItems(title: 'Chat with Faculty', icon: Icons.chat),
    DrawerItems(title: 'Contact Us', icon: Icons.contact_page),
    DrawerItems(title: 'F.A.Q\'s', icon: Icons.feedback_rounded),
    DrawerItems(title: 'Log Out', icon: Icons.logout_rounded),
  ];
  final drawerPages = <String>[
    '/performance',
    '/calender',
    '/downloads',
    '/default',
    '/contactus',
    '/faq',
    '/logout',
  ];
  CustomeDrawer({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Drawer(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
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
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.only(left: 30, right: 40),
                  itemBuilder: (context, item) {
                    return ListTile(
                      onTap: () {
                        (draweritems[item].title == 'Log Out')?showDialog(context: context, builder: (BuildContext context) => AlertDialog(
          title: const Text('Logout'),
          content: const Text('Do you want to logout'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),):Navigator.of(context).popAndPushNamed(
                          drawerPages[item],
                        );
                      },
                      leading: Icon(
                        draweritems[item].icon,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      title: Text(
                        draweritems[item].title,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    );
                  },
                  separatorBuilder: (context, sep) {
                    return Divider(
                      height: 2,
                    );
                  },
                  itemCount: draweritems.length),
            ),
          ],
        ),
      ),
      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
    );
  }
}

class DefaultPage extends StatelessWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'Deafult Page',
          )),
    );
  }
}


  
