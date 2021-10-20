import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:imstitute/models/eventModals.dart';
import 'package:imstitute/models/study_modals.dart';

class Services {
  static var client = http.Client();

  static Future<Map<String, List<MyEvent>>> fetchEvent() async {
    await Future.delayed(const Duration(seconds: 1));
    return fakeData;
  }

  static Future<Study> fetchStudy() async {
    String data = await rootBundle.loadString('json/study_material.json');
    var jsonResult = json.decode(data);
    return studyFromJson(jsonResult);
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
