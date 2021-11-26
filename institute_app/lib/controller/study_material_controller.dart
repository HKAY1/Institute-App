import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imstitute/custome/customeWidgets.dart';
import 'package:imstitute/models/study_modals.dart';
import '../services/services.dart';

class StudyController extends GetxController {
  var g = GetStorage();
  @override
  void onInit() {
    subjects();
    super.onInit();
  }

  void toast(
      {String title = 'Error', String message = 'Something Went Wrong'}) {
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

  // var notes = <Notes>[].obs;
  // var loadingNote = true.obs;
  var subj = <SubjData>[].obs;
  var loadingSubj = true.obs;

  // Future<void> fetchNotes(String s) async {
  //   loadingNote(true);
  //   try {
  //     var clas = g.read('class');
  //     var token = g.read('token');
  //     var note = await Services.fetchNotes(clas: clas, token: token, subj: s);
  //     notes(note);
  //     loadingNote(false);
  //   } catch (e) {
  //     loadingNote(false);
  //     toast(message: e.toString());
  //   }
  // }

  void subjects() async {
    loadingSubj(true);
    try {
      var s = await Services.fetchSubjects(token: g.read('token') ?? '');
      subj(s);
      loadingSubj(false);
    } catch (e) {
      loadingSubj(false);
      toast(message: e.toString());
    }
  }
}
