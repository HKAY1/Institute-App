// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edeazy/controller/authorisation_controller.dart';
import 'package:edeazy/custome/colorScheme.dart';

class DrawerItems {
  final String title;
  final IconData icon;
  DrawerItems({this.title = 'Error', this.icon = Icons.error});
}

class CustomeDrawer extends StatefulWidget {
  const CustomeDrawer({Key? key}) : super(key: key);

  @override
  State<CustomeDrawer> createState() => _CustomeDrawerState();
}

class _CustomeDrawerState extends State<CustomeDrawer> {
  var controll = Get.put(AuthrisationController());
  final draweritems = [
    DrawerItems(title: 'Performance', icon: Icons.insights_rounded),
    DrawerItems(title: 'Downloads', icon: Icons.download),
    DrawerItems(title: 'Chat with Faculty', icon: Icons.chat),
    DrawerItems(title: 'Contact Us', icon: Icons.contact_page),
    DrawerItems(title: 'F.A.Q\'s', icon: Icons.feedback_rounded),
    DrawerItems(title: 'Log Out', icon: Icons.logout_rounded),
  ];

  final drawerPages = <String>[
    '/performance',
    '/downloads',
    '/default',
    '/contactus',
    '/faq',
    '/logout',
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Drawer(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.back();
                Get.toNamed('/profile');
              },
              child: Hero(
                tag: 'profile',
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Stack(
                        fit: StackFit.passthrough,
                        children: [
                          Center(
                            child: Obx(() {
                              return CachedNetworkImage(
                                placeholder: (_, s) {
                                  return CircleAvatar(
                                    maxRadius: 40,
                                    minRadius: 20,
                                    child: Icon(
                                      Icons.person,
                                      size: 40,
                                    ),
                                  );
                                },
                                imageUrl: controll.url.value
                                    .replaceAll('localhost', '192.168.1.18'),
                                // progressIndicatorBuilder:
                                //     (context, url, downloadProgress) =>
                                //         CircularProgressIndicator(
                                //             value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    CircleAvatar(
                                  maxRadius: 40,
                                  minRadius: 20,
                                  child: Icon(
                                    Icons.person,
                                    size: 40,
                                  ),
                                ),
                                imageBuilder: (_, img) {
                                  return CircleAvatar(
                                    maxRadius: 40,
                                    minRadius: 20,
                                    backgroundImage: img,
                                  );
                                },
                              );
                            }),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.blue,
                              ),
                            ),
                            right: 115,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        controll.userinfo(key: 'name'),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.only(left: 30, right: 40),
                  itemBuilder: (context, item) {
                    return ListTile(
                      onTap: () {
                        if (draweritems[item].title == 'Log Out') {
                          Get.dialog(
                            AlertDialog(
                              title: const Text(
                                'Logout',
                                style: TextStyle(color: Colors.black),
                              ),
                              content: const Text('Do you want to logout',
                                  style: TextStyle(color: Colors.black)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controll.removeUser();
                                    Get.offAllNamed('/login');
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          Get.toNamed(drawerPages[item]);
                        }
                      },
                      leading: Icon(
                        draweritems[item].icon,
                        color: cardcolor,
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
