import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imstitute/models/aothorised_modal.dart';
import 'package:imstitute/models/eventModals.dart';
import 'package:imstitute/models/study_modals.dart';

class Services {
  static var client = http.Client();

  static Future<Map<String, List<Events>>> fetchEvent() async {
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
    return fakeEventData;
  }

  static Future<List<Notes>> fetchStudy() async {
    await Future.delayed(const Duration(seconds: 1));
    return fakeNotesData;
    // String data = await rootBundle.loadString('json/study_material.json');
    // var jsonResult = json.decode(data);
    // return List.from(jsonResult['notes'])
    //     .map((e) => Notes.fromJson(e))
    //     .toList();
  }
}

var fakeNotesData = [
  Notes(chapter: 01, title: 'EM Wave', data: [
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
  ]),
  Notes(chapter: 21, title: 'EM Wave', data: [
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
  ]),
  Notes(chapter: 03, title: 'EM Wave', data: [
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
  ]),
  Notes(chapter: 15, title: 'EM Wave', data: [
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
  ]),
  Notes(chapter: 14, title: 'EM Wave', data: [
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
  ]),
  Notes(chapter: 09, title: 'EM Wave', data: [
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
    Data(topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
  ])
];

var fakeEventData = <String, List<Events>>{
  '1633804200000': [
    Events(
      name: 'PTM Notice',
      description: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: 1635445800000,
      endTime: 1635445800000,
    ),
    Events(
      name: 'Guu Notice',
      description: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: 1635445800000,
      endTime: 1635445800000,
    ),
    Events(
      name: 'poi Notice',
      description: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: 1635445800000,
      endTime: 1635445800000,
    ),
  ],
  '1635445800000': [
    Events(
      name: 'PTM Notice',
      description: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: 1635445800000,
      endTime: 1635445800000,
    ),
    Events(
      name: 'Guu Notice',
      description: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: 1635445800000,
      endTime: 1635445800000,
    ),
    Events(
      name: 'poi Notice',
      description: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: 1635445800000,
      endTime: 1635445800000,
    ),
    Events(
      name: 'poi Notice',
      description: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: 1635445800000,
      endTime: 1635445800000,
    ),
  ],
};
