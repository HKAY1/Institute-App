import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imstitute/models/aothorised_modal.dart';
import 'package:imstitute/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthrisationController extends GetxController {
  Future<void> login({required String number, required String password}) async {
    try {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
      UserData data =
          await LoginServices.login(num: number, password: password);
      storeUser(data: data.data);
      Get.back();
      Get.offAllNamed('/homepage');
    } catch (e) {
      Get.back();
      Get.snackbar(
        e.toString(),
        '',
        isDismissible: true,
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
      );
    }
  }

  void storeUser({required UserInfo? data}) async {
    final g = await SharedPreferences.getInstance();
    g.setString('data', jsonEncode(data!.toJson()));
    g.setBool('isloggedin', true);
  }

  void removeUser() async {
    final g = await SharedPreferences.getInstance();
    g.setBool('isloggedin', false);
    g.remove('data');
  }

  Future<UserInfo?> userinfo() async {
    final g = await SharedPreferences.getInstance();
    final data = g.getString('data');
    if (data != null) {
      return UserInfo.fromJson(jsonDecode(data));
    }
    return null;
  }
}
