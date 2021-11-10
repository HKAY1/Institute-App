// ignore_for_file: prefer_const_declarations

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teacher_institute/modals/teacher_eventmodal.dart';

class Services {
  static var client = http.Client();

  static Future<Map<String, List<MyEvent>>> fetchEvent() async {
    await Future.delayed(const Duration(seconds: 1));
    return fakeData;
  }
  static Future<List> postEvent( 
     String title ,
    String description,
    List<String?> classes,
    int startDatefromEpoch,
    int endDatefromEpoch,
    int startTime,
    int endTime) async {
      final bod = jsonEncode({
    "name": title,
    "class": classes,
    "startDateEpoch": startDatefromEpoch,
    "startTime": startTime,
    "endDateEpoch": endDatefromEpoch,
    "endTime": endTime,
    "description": description,
    });
      var token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTcyYWNiOTMxNTQzZjVlY2Q4Nzc2ZmEiLCJpYXQiOjE2MzQ5MDUzNDl9.TsSCvvKYGm90w1Zd0TQaYkr1-wkGioP0Yu2FuP5UNsM';
     final String uri ='http://192.168.1.128:9000/api/events';
    // await Future.delayed(const Duration(seconds: 1));
    var response= await http.post(Uri.parse(uri),
    headers: {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $token',
    },
    body:bod
    );
    print(response.body);
    if(response.statusCode == 200){
      final String resString = response.body;
      return [true,resString];
    }
    else {return [false,'Failed'];}
  }
}

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
