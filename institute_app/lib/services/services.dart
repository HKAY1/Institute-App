import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:imstitute/models/eventModals.dart';
import 'package:imstitute/models/study_modals.dart';

class Services {
  static var client = http.Client();
  static var baseURL = 'http://192.168.0.117:9000/api';

  static Future<Map<String, List<Events>>> fetchEvent(
      {required String token, required int from, required int to}) async {
    try {
      var res = await client.get(
          Uri.parse("$baseURL/events?fromDate=$from&toDate=$to"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }).timeout(const Duration(seconds: 10));
      var data = jsonDecode(res.body);
      if (data['success']) {
        return eventsFromJson(data['data']);
      }
      throw data['error']['message'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }

    // await Future.delayed(const Duration(seconds: 1));
    // return fakeEventData;
  }

  static Future<List<SubjData>> fetchSubjects({required String token}) async {
    try {
      var res = await client
          .get(Uri.parse("$baseURL/users/student-subjects"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }).timeout(const Duration(seconds: 10));
      var data = jsonDecode(res.body);
      if (data['success']) {
        return subjfromjason(data['data']);
      }
      throw data['error']['message'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }

  static Future<List<Notes>> fetchNotes(
      {required String token,
      required String clas,
      required String subj}) async {
    // await Future.delayed(const Duration(seconds: 1));
    // return fakeNotesData;
    try {
      var res = await client.get(
          Uri.parse("$baseURL/study/notes/$clas/$subj/chapters"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }).timeout(const Duration(seconds: 10));
      var data = jsonDecode(res.body);
      if (data['success']) {
        print(data['data']);
        return notesfrom(data['data']);
      }
      throw data['error']['message'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }

  static Future<List<Topics>> fetchTopics({
    required String token,
    required String id,
  }) async {
    try {
      var res = await client
          .get(Uri.parse("$baseURL/study/notes/$id/topics"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }).timeout(const Duration(seconds: 10));
      var data = jsonDecode(res.body);
      if (data['success']) {
        print(data['data']);
        return topicsfrom(data['data']);
      }
      throw data['error']['message'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }
}

// var fakeNotesData = [
//   Notes(
//       chapter: '01',
//       clas: '10',
//       subject: 'Math',
//       id: '10',
//       name: 'EM Wave',
//       notesData: [
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
//       ]),
//   Notes(
//       chapter: '21',
//       clas: '10',
//       subject: 'Math',
//       id: '10',
//       name: 'EM Wave',
//       notesData: [
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
//       ]),
//   Notes(
//       chapter: '03',
//       clas: '10',
//       subject: 'Math',
//       id: '10',
//       name: 'EM Wave',
//       notesData: [
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
//       ]),
//   Notes(
//       chapter: '15',
//       clas: '10',
//       subject: 'Math',
//       id: '10',
//       name: 'EM Wave',
//       notesData: [
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
//       ]),
//   Notes(
//       chapter: '14',
//       clas: '10',
//       subject: 'Math',
//       id: '10',
//       name: 'EM Wave',
//       notesData: [
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
//       ]),
//   Notes(
//       chapter: '09',
//       clas: '10',
//       subject: 'Math',
//       id: '10',
//       name: 'EM Wave',
//       notesData: [
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge'),
//         NotesData(
//             topic: 'florine /detalta', file: 'dgcwdgcvdghecvgehdvchgedcvhge')
//       ])
// ];

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
