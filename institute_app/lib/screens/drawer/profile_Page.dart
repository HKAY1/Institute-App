// ignore_for_file: file_names, prefer_const_constructors

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imstitute/controller/authorisation_controller.dart';
import 'package:imstitute/custome/colorScheme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imstitute/models/aothorised_modal.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var controll = Get.put(AuthrisationController()) as UserInfo;
  final ImagePicker _picker = ImagePicker();
  File? _image;
  late TextEditingController contName;
  late TextEditingController contAdd;
  late TextEditingController contEmail;
  var data = Get.find<AuthrisationController>().userinfo();

  @override
  void initState() {
    // data = await controll.userinfo();
    super.initState();
    contName = TextEditingController(text: 'data.');
    contAdd = TextEditingController(text: 'data!.address');
    contEmail = TextEditingController(text: 'data!.email');
  }

  @override
  Widget build(BuildContext context) {
    final bottoms = MediaQuery.of(context).viewInsets.bottom;
    Size size = MediaQuery.of(context).size;

    _imgFromCamera() async {
      XFile? image =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    }

    _imgFromGallery() async {
      XFile? image = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);

      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    }

    // ImageProvider getImage() {
    //   if (kIsWeb) {
    //     return Image.network(_image!.path).image;
    //   }
    //   return Image.file(_image!).image;
    // }

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
                    child: CachedNetworkImage(
                      imageUrl: 'data.'
                          .replaceAll('localhost:9000', '192.168.0.109:9000'),
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
                      onPressed: () {
                        if (kIsWeb) {
                          _imgFromGallery();
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
                                      _imgFromGallery();
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
                                      _imgFromCamera();
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
                      'data!.phoneNumber',
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
          editfield(
            header: 'Name',
            enable: true,
            contr: contName,
          ),
          editfield(header: 'Email Address', enable: true, contr: contEmail),
          editfield(
              header: 'Adress', enable: true, length: 300, contr: contAdd),
          editfield(header: 'Class', detail: 'data!.dataClass[0].name'),
          editfield(header: 'Institute', detail: ' data!.gender'),
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
                onPressed: () {},
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
