// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var data = MyDataUpdate(
    add: 'bvvcvbndgf',
    email: 'email',
    lass: '12',
    stream: 'Science',
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void editButtonPress() {
      showModalBottomSheet(
        clipBehavior: Clip.hardEdge,
        constraints: BoxConstraints(
          maxHeight: size.height * 0.90,
          minHeight: size.height * 0.4,
        ),
        isScrollControlled: true,
        routeSettings: RouteSettings(
          arguments: MyDataUpdate(
            add: data.add,
            email: data.email,
            lass: data.lass,
            stream: data.stream,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(200, 60),
          ),
        ),
        context: context,
        builder: (context) {
          final arg =
              ModalRoute.of(context)!.settings.arguments as MyDataUpdate;
          var stream = arg.stream;
          var add = arg.add;
          var lass = arg.lass;
          var email = arg.email;
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 30),
                    height: 5,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
                Flexible(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(bottom: 15, left: 30, right: 30),
                        child: TextField(
                          onChanged: (i) {
                            email = i;
                          },
                          controller: TextEditingController()..text = email,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                            label: Text(
                              'Email',
                              style: TextStyle(fontSize: 15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: TextField(
                          onChanged: (i) {
                            lass = i;
                          },
                          controller: TextEditingController()..text = lass,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                            label: Text('Class'),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: TextField(
                          onChanged: (i) {
                            stream = i;
                          },
                          controller: TextEditingController()..text = stream,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                            label: Text('Stream'),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20, bottom: 30, left: 30, right: 30),
                        child: TextField(
                          onChanged: (i) {
                            add = i;
                          },
                          controller: TextEditingController()..text = add,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                            label: Text('Address'),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            minimumSize: Size(150, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            backgroundColor: Colors.blue,
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(
                              () {
                                data = MyDataUpdate(
                                  add: add,
                                  email: email,
                                  lass: lass,
                                  stream: stream,
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.upgrade_rounded),
                          label: Text('Update Profile'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Hero(
                tag: 'profile',
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        maxRadius: 70,
                        minRadius: 40,
                        backgroundImage:
                            Image.asset('images/monkey_profile.jpg').image,
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: size.width * 0.49,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.camera_alt_rounded,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Ravi',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                'Mobile No.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  fontWeight: Theme.of(context).textTheme.headline3!.fontWeight,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
              child: Text(
                '473809',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: Text(
                'Email Address',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  fontWeight: Theme.of(context).textTheme.headline3!.fontWeight,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
              child: Text(
                data.email,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: Text(
                'Class',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  fontWeight: Theme.of(context).textTheme.headline3!.fontWeight,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
              child: Text(
                data.lass,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: Text(
                'Stream',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  fontWeight: Theme.of(context).textTheme.headline3!.fontWeight,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
              child: Text(
                data.stream,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: Text(
                'Address',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  fontWeight: Theme.of(context).textTheme.headline3!.fontWeight,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
              child: Text(
                data.add,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: Text(
                'Institute',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  fontWeight: Theme.of(context).textTheme.headline3!.fontWeight,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
              child: Text(
                'Allen poi',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Align(
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                  ),
                  onPressed: () => editButtonPress(),
                  icon: Icon(Icons.edit),
                  label: Text('Edit Profile'),
                ),
              ),
            )
          ],
        ),
    );
  }
}

class MyDataUpdate {
  String email;
  String lass;
  String add;
  String stream;
  MyDataUpdate(
      {required this.add,
      required this.email,
      required this.lass,
      required this.stream});
}
