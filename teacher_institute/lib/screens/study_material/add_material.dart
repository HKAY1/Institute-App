// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, unrelated_type_equality_checks, avoid_print, unused_element

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teacher_institute/controller/teach_material_controller.dart';

class AddMaterial extends StatefulWidget {
  const AddMaterial({Key? key}) : super(key: key);

  @override
  State<AddMaterial> createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {
  static var baseURL = 'http://192.168.0.117:9000/api';
  UploadFilecontroller con = Get.put(UploadFilecontroller());
  final cont = Get.put(MaterialControler());
  var t = GetStorage();
  final data = Get.arguments;
  final chaptercontroller = TextEditingController();
  final discriptioncontroller = TextEditingController();
  final nocontroller = TextEditingController();
  final formkey = GlobalKey();
  int selectedIndex = 0;
  bool s = false;
  String files = '           ';

  @override
  void dispose() {
    chaptercontroller.dispose();
    discriptioncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create ${data['mat'] ?? ''}'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20, left: 12),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              if (data['mat'] == 'Notes')
                TextFormField(
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Chapter No.',
                    hintText: 'eg :- 1 ',
                    border: UnderlineInputBorder(),
                  ),
                  onFieldSubmitted: (_) {},
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (v) {
                    if (!GetUtils.isNumericOnly(v ?? '')) {
                      return "Invalid Entry";
                    }
                  },
                  controller: nocontroller,
                ),
              SizedBox(height: 18),
              Column(
                children: [
                  if (data['mat'] == 'Notes')
                    TextFormField(
                      validator: (title) => title != null && title.isEmpty
                          ? 'Title should not be empty'
                          : null,
                      minLines: 1,
                      maxLines: 5,
                      maxLength: 50,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      decoration: InputDecoration(
                        labelText: ' Chapter Name',
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (_) {},
                      controller: chaptercontroller,
                    ),
                  SizedBox(height: 15),
                  Visibility(
                    visible: selectedIndex == 0,
                    child: TextFormField(
                      validator: (topic) => topic != null && topic.isEmpty
                          ? 'Topic Name should not be empty'
                          : null,
                      minLines: 1,
                      maxLines: 5,
                      maxLength: 40,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      decoration: InputDecoration(
                        labelText: ' Topic Name',
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (_) {},
                      controller: discriptioncontroller,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () async {
                      setState(() {
                        s = true;
                      });
                      final result = await FilePicker.platform.pickFiles();
                      if (result == null) {
                        return;
                      }
                      final file = result.files.first;
                      File path = File(file.path!);
                      setState(() {
                        files = result.files.first.name;
                      });
                      var token = t.read('token') ?? '';
                      con.postFile(type: data['mat'], token: token, file: path);
                    },
                    icon: Icon(Icons.upload_rounded),
                    label: Text('Choose File'),
                  ),
                  SizedBox(height: 15),
                  Visibility(
                    visible: s,
                    child: Container(
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
                          Text(
                            files,
                            style: TextStyle(color: Colors.black),
                          ),
                          IconButton(
                              onPressed: () {
                                Future<void> deletefile(
                                    {required String token}) async {
                                  var token = t.read('token') ?? '';
                                  try {
                                    var response = await http.delete(
                                      Uri.parse(
                                          '$baseURL/file/study-material/$resid'),
                                      headers: {
                                        'Content-Type': 'application/json',
                                        'Accept': 'application/json',
                                        'Authorization': 'Bearer $token',
                                      },
                                    );
                                    final resString = jsonDecode(response.body);
                                    if (resString['success'] ?? false) {
                                      toast(
                                          title: 'Success',
                                          message: resString['data']);
                                    }
                                    toast(
                                        title: 'Error',
                                        message: 'Failed to remove');
                                  } on TimeoutException {
                                    throw 'API not Responding';
                                  } on SocketException {
                                    throw 'Can\'t connect to API';
                                  }
                                }
                              },
                              icon: Icon(Icons.remove)),
                        ],
                      ),
                    ),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      cont.postMaterialtdata(
                          clas: data['class'],
                          subject: data['subject'],
                          chapname: chaptercontroller.text,
                          chapno: nocontroller.text,
                          res: resid,
                          type: data['mat'],
                          topic: discriptioncontroller.text);
                    },
                    label: Text('Add Material'),
                    icon: Icon(Icons.arrow_forward_rounded),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void toast({String title = 'Error', String message = 'Something Went wrong'}) {
  Get.snackbar(
    title,
    message,
    colorText: Colors.black,
    maxWidth: double.maxFinite,
    margin: const EdgeInsets.all(0),
    isDismissible: true,
    snackPosition: SnackPosition.BOTTOM,
    dismissDirection: SnackDismissDirection.HORIZONTAL,
  );
}
