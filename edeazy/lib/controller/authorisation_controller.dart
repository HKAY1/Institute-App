import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:edeazy/custome/customeWidgets.dart';
import 'package:edeazy/models/aothorised_modal.dart';
import 'package:edeazy/services/login_service.dart';

class AuthrisationController extends GetxController {
  final g = GetStorage();
  var isLoading = true.obs;
  var url = ''.obs;

  @override
  void onInit() {
    String d = g.read('url') ?? '';
    if (d.isNotEmpty) {
      url(d);
    }
    super.onInit();
  }

  void dialog() {
    Get.dialog(
      const Center(
        child: CustomeLoading(
          color: Colors.blueAccent,
        ),
      ),
      barrierDismissible: false,
    );
  }

  void toast(
      {String title = 'Error', String message = 'Something Went Wrong'}) {
    Get.snackbar(title, message,
        isDismissible: true,
        colorText: Colors.black,
        maxWidth: double.maxFinite,
        margin: const EdgeInsets.all(0),
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: DismissDirection.horizontal);
  }

  Future<void> login(
      {required String userName, required String password}) async {
    try {
      dialog();
      var data =
          await LoginServices.login(userName: userName, password: password);
      refreshUser(data: data);
      debugPrint(data.toJson().toString());
      // Get.back();
      url(data.url);
      Get.offAllNamed('/homepage');
    } catch (e) {
      debugPrint(e.toString());
      Get.back();
      toast(message: e.toString());
    }
  }

  void updateUserData(String mail, String add, String gen) async {
    try {
      var t = g.read('token') ?? '';
      var i = g.read('id') ?? '';
      dialog();
      var data = await LoginServices.updateProfileData(
          token: t, id: i, obj: {"email": mail, "address": add, "gender": gen});
      refreshUser(data: data);
      Get.back();
      toast(title: 'Profile Updated Successfully', message: '');
    } catch (e) {
      Get.back();
      toast(message: e.toString());
    }
  }

  Future<bool> refreshProfile() async {
    try {
      var t = g.read('token') ?? '';
      UserData data = await LoginServices.fetchProfile(t);
      url(data.toString());
      refreshUser(data: data);
      return true;
    } catch (e) {
      return false;
    }
  }

  void changePassword(String npass) async {
    try {
      Get.back();
      dialog();
      await LoginServices.changePass(npass, g.read('token') ?? '');
      Get.back();
      Get.snackbar(
        'Password Changed Successfully',
        '',
        isDismissible: true,
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: DismissDirection.horizontal,
      );
    } catch (e) {
      Get.back();
      toast(message: e.toString());
    }
  }

  void uploadImage(String path, String type, bool web) async {
    try {
      dialog();
      var d = await LoginServices.upload(
        imagePath: path,
        token: g.read('token'),
        type: type,
      );
      url(d);
      g.write('url', d);
      Get.back();
    } catch (e) {
      Get.back();
      toast(message: e.toString());
    }
  }

  void refreshUser({required UserData data}) {
    g.write('token', data.token);
    g.write('organisationId', data.organisationId);
    g.write('name', data.name);
    g.write('url', data.url);
    g.write('email', data.email);
    g.write('phone', data.phoneNumber.toString());
    g.write('lectures', data.lectures);
    g.write('address', data.address);
    g.write('id', data.id);
    g.write('gender', data.gender);
    // g.write('subjects', data.subjects);
  }

  String userinfo({required String key}) {
    final data = g.read(key);
    return data ?? '';
  }

  void removeUser() async {
    g.erase();
  }
}
