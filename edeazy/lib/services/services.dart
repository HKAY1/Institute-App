import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:edeazy/models/eventModals.dart';
import 'package:edeazy/models/study_modals.dart';

class Services {
  static var client = http.Client();
  static var baseURL = 'https://pure-crag-69424.herokuapp.com/api';

// API for Fetching Events

  static Future<List<Events>> fetchEvent(
      {required String token, required int from, required int to}) async {
    try {
      var res = await client.get(
          Uri.parse("$baseURL/organisation/events?fromDate=$from&toDate=$to"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }).timeout(const Duration(seconds: 30));
      var data = jsonDecode(res.body);
      if (data['success']) {
        return eventFromJson(data['data']);
      }
      throw data['error']['message'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }

// API for Fetching Subjects of Studentes

  static Future<List<SubjData>> fetchSubjects({required String token}) async {
    try {
      var res = await client.get(
          Uri.parse("$baseURL/organisation/lectures/user-subjects"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }).timeout(const Duration(seconds: 30));
      var data = jsonDecode(res.body);
      if (data['success']) {
        return subjfromjason(data['data'][0]['subjects']);
      }
      throw data['error']['message'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }

// API for Fetching Notes of subjects

  static Future<List<Notes>> fetchNotes(
      {required String token,
      required String clas,
      required String subj}) async {
    try {
      var res = await client.get(
          Uri.parse("$baseURL/study/notes/$clas/$subj/chapters"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }).timeout(const Duration(seconds: 30));
      var data = jsonDecode(res.body);
      if (data['success']) {
        return notesfrom(data['data']);
      }
      throw data['error']['message'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }

//API for Fetching Topics Of Chapters

  static Future<List<Topics>> fetchTopics({
    required String token,
    required String chapterid,
  }) async {
    try {
      var res = await client
          .get(Uri.parse("$baseURL/study/notes/$chapterid/topics"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }).timeout(const Duration(seconds: 30));
      var data = jsonDecode(res.body);
      if (data['success']) {
        return topicsfrom(data['data']);
      }
      throw data['error']['message'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }

// API for Fetching Assignments/Sample_Papers
  static Future<List<SecondaryMatModal>> fetchwork({
    required String token,
    required String clas,
    required String subj,
    required String smat,
  }) async {
    try {
      var res = await client.get(
          Uri.parse("$baseURL/study/secondary-material/$clas/$subj?type=$smat"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }).timeout(const Duration(seconds: 30));
      var data = jsonDecode(res.body);
      if (data['success']) {
        return secmatfrom(data['data']);
      }
      throw data['error']['message'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }

  static Future<String> fetchLectures({
    required String token,
  }) async {
    try {
      var res = await client.get(
          Uri.parse("http://192.168.1.25:2331/api/lectures/time-table"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }).timeout(const Duration(seconds: 30));
      var data = res.body;
      print('Data ====>  $data');
      return data;
      // throw data['error']['message'] ?? 'No data';
    } on TimeoutException {
      throw 'Api Not Responding';
    } on SocketException {
      throw 'Can\'t Connect to API';
    }
  }
}
