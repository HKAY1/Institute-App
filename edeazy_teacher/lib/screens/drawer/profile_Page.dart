// ignore_for_file: file_names, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:edeazy_teacher/controller/authorisation_controller.dart';
import 'package:edeazy_teacher/coustom/colorScheme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var d = Get.put(AuthrisationController());
  final ImagePicker _picker = ImagePicker();
  final FocusNode mailFocus = FocusNode();
  final FocusNode addFocus = FocusNode();
  late TextEditingController contAdd;
  late TextEditingController contEmail;
  late TextEditingController contPass = TextEditingController();
  late TextEditingController contNPass = TextEditingController();
  String gender = '';
  var changepassKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    gender = d.userinfo(key: 'gender');
    contAdd = TextEditingController(text: d.userinfo(key: 'address'));
    contEmail = TextEditingController(text: d.userinfo(key: 'email'));
  }

  @override
  Widget build(BuildContext context) {
    final bottoms = MediaQuery.of(context).viewInsets.bottom;
    Size size = MediaQuery.of(context).size;

    void pickImage(ImageSource source) async {
      XFile? image = await _picker.pickImage(
        source: source,
      );

      if (image != null) {
        d.uploadImage(image.path,
            image.path.substring(image.path.lastIndexOf(".") + 1), false);
      }
    }

    // void pickImageWeb() async {
    //   var image = await FilePicker.platform
    //       .pickFiles(type: FileType.image, allowedExtensions: []);
    //   if (image != null) {
    //     var data = image.files.single.bytes;
    //     if (data != null) {
    //       d.uploadImage(
    //           data,
    //           image.files.single.path!
    //               .substring(image.files.single.path!.lastIndexOf(".") + 1),
    //           true);
    //     }
    //   }
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
                    child: Obx(() {
                      return CachedNetworkImage(
                        imageUrl: d.url.replaceAll('localhost', '192.168.1.18'),
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
                          pickImage(ImageSource.gallery);
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
                                      pickImage(ImageSource.gallery);
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
                                      pickImage(ImageSource.camera);
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
                  onPressed: () {},
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
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: TextFormField(
              focusNode: mailFocus,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (s) {
                mailFocus.unfocus();
              },
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (!GetUtils.isEmail(value ?? '')) {
                  return "Enater valid Email";
                }
                return null;
              },
              controller: contEmail,
              maxLines: null,
              enabled: true,
              maxLength: 50,
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
                  'Email Address',
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
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: TextFormField(
              focusNode: addFocus,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (s) {
                addFocus.unfocus();
              },
              keyboardType: TextInputType.streetAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == '') {
                  return "";
                }
                return null;
              },
              controller: contAdd,
              maxLines: null,
              maxLength: 300,
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
                  'Address',
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
          ),
          Text(
            'Gender',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.blueAccent),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              FilterChip(
                elevation: 10,
                backgroundColor: Colors.grey,
                selectedColor: Colors.blueAccent,
                disabledColor: Colors.white,
                checkmarkColor: Colors.white,
                labelStyle: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
                label: Text('Male'),
                selected: gender == 'Male',
                onSelected: (f) {
                  setState(() {
                    gender = 'Male';
                  });
                },
              ),
              SizedBox(width: 30),
              FilterChip(
                elevation: 10,
                backgroundColor: Colors.grey,
                selectedColor: Colors.blueAccent,
                disabledColor: Colors.white,
                checkmarkColor: Colors.white,
                labelStyle: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
                label: Text('Female'),
                selected: gender == 'Female',
                onSelected: (f) {
                  setState(() {
                    gender = 'Female';
                  });
                },
              )
            ],
          ),
          SizedBox(height: 30),
          // editfield(
          //     header: 'Class', detail: d.userinfo(key: 'class').toString()),
          // editfield(header: 'Gender', detail: d.userinfo(key: 'gender')),
          TextButton(
            onPressed: () {
              changePassword(context);
            },
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
                  d.updateUserData(contEmail.text, contAdd.text, gender);
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

  void changePassword(BuildContext context) {
    showModalBottomSheet(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Form(
            key: changepassKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Visibility(
                //   child: Text('Password Dosen\'t Match'),
                //   visible: changepassKey.currentState!.validate(),
                // ),
                TextFormField(
                  controller: contPass,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (v) {
                    if (v == '') {
                      return '* Required';
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.headline3,
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.black26,
                      ),
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                    label: Text(
                      'New Password',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    hintText: 'Create your new Password',
                    hintStyle: TextStyle(color: Colors.black12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: contNPass,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (v) {
                    if (v != contPass.text) {
                      return 'Password Doesn\'t Matches';
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.headline3,
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.black26,
                      ),
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                    label: Text(
                      'Confirm Password',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    hintText: 'Confirm your new Password',
                    hintStyle: TextStyle(color: Colors.black12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (changepassKey.currentState!.validate()) {
                      d.changePassword(contPass.text);
                    }
                  },
                  child: Text('Reset Password'),
                  style: TextButton.styleFrom(
                    minimumSize: Size(180, 50),
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    backgroundColor:
                        Theme.of(context).appBarTheme.backgroundColor,
                    primary: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
