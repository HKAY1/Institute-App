// ignore_for_file: prefer_const_declarations

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:teacher_institute/modals/teacher_eventmodal.dart';
import 'package:teacher_institute/modals/teacher_studymodal.dart';

class Services {
  static var client = http.Client();
  static var baseURL = 'http://192.168.0.117:9000/api';
  //to fetch data of events
  static Future<Map<String, List<MyEvent>>> fetchEvent() async {
    // var token =
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTcyYWNiOTMxNTQzZjVlY2Q4Nzc2ZmQiLCJpYXQiOjE2MzUzMjEyOTd9.k76ECTqpiCurr7Y-YRkRp4niDdAuHIMRyHJMJ6gG1D0';
    // var res = await client.get(
    //     Uri.parse(
    //         "http://192.168.1.128:9000/api/events?fromDate=1635100200000&toDate=1635445800000"),
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'Accept': 'application/json',
    //       'Authorization': 'Bearer $token',
    //     });
    // if (res.statusCode == 200) {
    //   print("works fine");
    // }
    // var data = jsonDecode(res.body);
    // print(data);
    // return eventsFromJson(data['data']);
    await Future.delayed(const Duration(seconds: 1));
    return fakeData;
  }

  //to fetch data of class and subject of teacher
  static Future<List<Teacher>> fetchmaterial({required String token}) async {
    try {
      var response = await http.get(
        Uri.parse('$baseURL/users/teacher-subjects'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      final resString = jsonDecode(response.body);
      print(resString);
      if (resString['success'] ?? false) {
        print(resString['data']);
        return teacherclasfrom(resString['data']);
      }
      throw resString['error']['message'] ?? 'No Data';
    } on TimeoutException {
      throw 'API not Responding';
    } on SocketException {
      throw 'Can\'t connect to API';
    }
  }

  //to post event

  static Future<void> postEvent(
      {required String title,
      required String description,
      required String token,
      required List<String?> classes,
      required int startDatefromEpoch,
      required int endDatefromEpoch,
      required int startTime,
      required int endTime}) async {
    try {
      final bod = jsonEncode({
        "name": title,
        "class": classes,
        "startDateEpoch": startDatefromEpoch,
        "startTime": startTime,
        "endDateEpoch": endDatefromEpoch,
        "endTime": endTime,
        "description": description,
      });

      var response = await http.post(Uri.parse('$baseURL/events'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: bod);
      final resString = jsonDecode(response.body);
      if (resString['success'] ?? false) {
        return;
      }
      throw resString['error']['message'] ?? 'No Data';
    } on TimeoutException {
      throw 'API not Responding';
    } on SocketException {
      throw 'Can\'t connect to API';
    }
  }

  //For Notes
  static Future<void> postNotesMaterialtdata({
    required String res,
    required String token,
    required String clas,
    required String subject,
    String? chapno,
    String? chapname,
    required String topic,
  }) async {
    try {
      final bod = jsonEncode({
        "chapterNumber": chapno,
        "class": clas,
        "subject": subject,
        "chapterName": chapname,
        "topic": {
          "name": topic,
          "file": res,
        }
      });

      var response = await http.post(Uri.parse('$baseURL/study/notes/chapters'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: bod);
      final resString = jsonDecode(response.body);
      if (resString['success'] ?? false) {
        return;
      }
      throw resString['error']['message'] ?? 'No Data';
    } on TimeoutException {
      throw 'API not Responding';
    } on SocketException {
      throw 'Can\'t connect to API';
    }
  }

  //For Assingnment and sample paper
  static Future<void> postAssampletMaterialtdata({
    required String clas,
    required String subject,
    required String res,
    required String token,
    required String topic,
  }) async {
    try {
      final bod = jsonEncode({
        "file": res,
        "name": topic,
        "class": clas,
        "subject": subject,
      });

      var response =
          await http.post(Uri.parse('$baseURL/study/secondary-material'),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: bod);
      final resString = jsonDecode(response.body);
      if (resString['success'] ?? false) {
        return;
      }
      throw resString['error']['message'] ?? 'No Data';
    } on TimeoutException {
      throw 'API not Responding';
    } on SocketException {
      throw 'Can\'t connect to API';
    }
  }

//For file upload
  static Future<String> postFile({
    required String type,
    required String token,
    required File file,
  }) async {
    try {
      var dio = Dio();
      String fileName = 'pro.pdf';
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path,
            contentType: MediaType('pdf', 'pdf')),
        "name": fileName,
        "type": type
      });
      //   final bod = jsonEncode({
      //     "name":fileName,
      //     "type":type,
      //     "file":formData,
      // });

      var response = await dio.post('$baseURL/file/upload-study-material',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
          data: formData);
      final resString = jsonDecode(response.data);
      print(resString['success']);
      if (resString['success'] ?? false) {
        return resString['_id'];
      }
      throw resString['error']['message'] ?? 'No Data';
    } on TimeoutException {
      throw 'API not Responding';
    } on SocketException {
      throw 'Can\'t connect to API';
    }
  }
}
//for file delete

var fakeData = <String, List<MyEvent>>{
  '1633804200000': [
    MyEvent(
      name: 'PTM Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:20 PM',
      endTime: '12:30 AM',
    ),
    MyEvent(
      name: 'Guu Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:20 PM',
      endTime: '12:30 AM',
    ),
    MyEvent(
      name: 'poi Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:30 AM',
      endTime: '12:30 AM',
    ),
  ],
  '1635445800000': [
    MyEvent(
      name: 'PTM Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:30 AM',
      endTime: '12:30 AM',
    ),
    MyEvent(
      name: 'Guu Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:30 AM',
      endTime: '12:30 AM',
    ),
    MyEvent(
      name: 'poi Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:30 AM',
      endTime: '12:30 AM',
    ),
    MyEvent(
      name: 'poi Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:30 AM',
      endTime: '12:30 AM',
    ),
  ],
};
