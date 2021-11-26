import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imstitute/custome/customeWidgets.dart';
import 'package:imstitute/models/study_modals.dart';
import 'package:imstitute/services/services.dart';

class SubjectController extends GetxController {
  var g = GetStorage();

  SubjectController(String s) {
    fetchNotes(s);
  }

  var notes = <Notes>[];

  var loadingNote = true.obs;

  void fetchNotes(String s) async {
    loadingNote(true);
    try {
      var t = g.read('token') ?? '';
      var c = g.read('class') ?? '';
      var n = await Services.fetchNotes(token: t, subj: s, clas: c);
      notes = n;
      loadingNote(false);
      update();
    } catch (e) {
      loadingNote(false);
      update();
      toast(message: e.toString());
    }
  }
}

void toast({String title = 'Error', String message = 'Something Went Wrong'}) {
  Get.snackbar(
    title,
    message,
    isDismissible: true,
    colorText: Colors.black,
    maxWidth: double.maxFinite,
    margin: const EdgeInsets.all(0),
    snackPosition: SnackPosition.BOTTOM,
    dismissDirection: SnackDismissDirection.HORIZONTAL,
  );
}

void dialog() {
  Get.dialog(
    Center(
      child: CustomeLoading(),
    ),
    barrierDismissible: false,
  );
}

class TopicController extends GetxController {
  var g = GetStorage();
  TopicController(String s) {
    fetchTopics(s);
  }
  var topics = <Topics>[];

  var loadingTopics = true.obs;

  void fetchTopics(String id) async {
    loadingTopics(true);
    try {
      var t = g.read('token') ?? '';
      var n = await Services.fetchTopics(token: t, id: id);
      topics = n;
      loadingTopics(false);
      update();
    } catch (e) {
      loadingTopics(false);
      update();
      toast(message: e.toString());
    }
  }
}
