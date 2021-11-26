// ignore_for_file: file_names, prefer_const_constructors

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imstitute/controller/authorisation_controller.dart';
import 'package:imstitute/custome/colorScheme.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var d = Get.put(AuthrisationController());
  final ImagePicker _picker = ImagePicker();
  late TextEditingController contAdd;
  late TextEditingController contEmail;

  @override
  void initState() {
    super.initState();
    contAdd = TextEditingController(text: d.userinfo(key: 'address'));
    contEmail = TextEditingController(text: d.userinfo(key: 'email'));
  }

  @override
  Widget build(BuildContext context) {
    final bottoms = MediaQuery.of(context).viewInsets.bottom;
    Size size = MediaQuery.of(context).size;

    pick_image(ImageSource source) async {
      XFile? image = await _picker.pickImage(
        source: source,
      );

      if (image != null) {
        d.uploadImage(File(image.path),
            image.path.substring(image.path.lastIndexOf(".") + 1));
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: bottoms),
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
                    child: Obx(() {
                      return CachedNetworkImage(
                        imageUrl: d.url
                            .replaceAll('localhost:9000', '192.168.0.117:9000'),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => CircleAvatar(
                          maxRadius: 70,
                          minRadius: 50,
                          child: Icon(
                            Icons.person,
                            size: 100,
                          ),
                        ),
                        imageBuilder: (_, img) {
                          return CircleAvatar(
                            maxRadius: 70,
                            minRadius: 50,
                            backgroundImage: img,
                          );
                        },
                      );
                    }),
                  ),
                  Positioned(
                    bottom: 5,
                    left: size.width * 0.49,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        if (kIsWeb) {
                          pick_image(ImageSource.gallery);
                        } else {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext bc) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(8),
                                      primary: Colors.redAccent,
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          size: 30,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Remove',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(8),
                                    ),
                                    onPressed: () {
                                      pick_image(ImageSource.gallery);
                                      Get.back();
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.photo_library_rounded,
                                          size: 30,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Gallery',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(8),
                                      primary: Colors.pink,
                                    ),
                                    onPressed: () {
                                      pick_image(ImageSource.camera);
                                      Get.back();
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.camera,
                                          size: 30,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Camera',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
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
          SizedBox(height: 20),
          Center(
            child: Text(
              d.userinfo(key: 'name'),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Mobile No.',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 10,
                            color: Colors.black38,
                          ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      d.userinfo(key: 'phone'),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    print('object');
                  },
                  child: Text(
                    'Change',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          editfield(header: 'Email Address', enable: true, contr: contEmail),
          editfield(
              header: 'Adress', enable: true, length: 300, contr: contAdd),
          editfield(
              header: 'Class', detail: d.userinfo(key: 'class').toString()),
          editfield(header: 'Gender', detail: d.userinfo(key: 'gender')),
          TextButton(
            onPressed: () {},
            child: Text('Change Password'),
            style: TextButton.styleFrom(
              minimumSize: Size(150, 50),
              textStyle: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(vertical: 10),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              primary: Colors.white,
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
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                  primary: Colors.white,
                ),
                onPressed: () {
                  d.updateUserData(contEmail.text, contAdd.text);
                },
                icon: Icon(Icons.edit),
                label: Text('Update Profile'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget editfield({
    required String header,
    TextEditingController? contr,
    bool enable = false,
    String? detail,
    int length = 40,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: TextFormField(
        keyboardType: (header == 'Email Address')
            ? TextInputType.emailAddress
            : TextInputType.streetAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (!GetUtils.isEmail(value ?? '')) {
            return "Enater valid Email";
          }
        },
        controller: contr,
        maxLines: null,
        initialValue: detail,
        enabled: enable,
        maxLength: length,
        style: Theme.of(context).textTheme.headline3,
        onChanged: (i) {
          // email = i;
        },
        // controller: TextEditingController()..text = email,
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.redAccent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
          fillColor: Colors.grey[100],
          filled: true,
          label: Text(
            header,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: cardcolor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
