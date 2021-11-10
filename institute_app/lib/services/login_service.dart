import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:imstitute/models/aothorised_modal.dart';

class LoginServices {
  static var client = http.Client();
  static var baseURL = 'http://192.168.0.109:9000/api/';
  static Future<UserData> login({
    required String num,
    required String password,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('$baseURL/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"phoneNumber": num, "password": password}),
      );
      var data = jsonDecode(response.body);
      if (data == null) {
        throw 'No data';
      }
      return UserData.fromJson(data);
    } on SocketException {
      throw 'APi Error';
    } on TimeoutException {
      throw 'Api Not Responding';
    }
  }
}
