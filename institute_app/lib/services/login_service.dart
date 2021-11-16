import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:imstitute/models/aothorised_modal.dart';

class LoginServices {
  static var client = http.Client();
  static var baseURL = 'http://192.168.0.109:9000/api';

  static Future<UserData> login({
    required String num,
    required String password,
  }) async {
    try {
      var response = await client
          .post(
            Uri.parse('$baseURL/auth/login'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({"phoneNumber": num, "password": password}),
          )
          .timeout(const Duration(seconds: 10));
      print(response.body);
      var data = jsonDecode(response.body);
      // if (data == null) {
      //
      // }
      if (data['success']) {
        return UserData.fromJson(data['data']);
      }
      throw data['error'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }

  static Future<String> upload(
      {required String imageFile,
      required String token,
      required String type}) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse('$baseURL/file/upload-profile-image'),
    );
    Map<String, String> headers = {"Authorization": 'Bearer $token'};
    request.headers.addAll(headers);

    try {
      var pic = await http.MultipartFile.fromPath("file", imageFile,
          contentType: MediaType('image', type));
      request.files.add(pic);
      var response = await request.send();

      //Get the response from the server
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      final data = jsonDecode(responseString);
      if (data['success'] ?? false) {
        return data['imageUrl'];
      }
      throw data['error'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }

  static Future<UserData> updateProfileData(
      {required String token,
      required String mail,
      required String add,
      required String id}) async {
    try {
      var response = await client.put(
        Uri.parse("$baseURL/users/$id"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'email': mail, 'address': add}),
      );
      print(response.body);
      var data = jsonDecode(response.body);
      if (data['success']) {
        return UserData.fromJson(data['data']);
      }
      throw data['error'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }

  static Future<UserData> fetchProfile(String token) async {
    try {
      var response =
          await client.get(Uri.parse("$baseURL/users/profile"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      var data = jsonDecode(response.body);
      if (data['success']) {
        return UserData.fromJson(data['data']);
      }
      throw data['error'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }
}
