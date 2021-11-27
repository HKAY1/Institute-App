// ignore_for_file: prefer_const_declarations, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:teacher_institute/controller/teach_material_controller.dart';
import 'package:teacher_institute/modals/teacher_eventmodal.dart';
import 'package:teacher_institute/modals/teacher_studymodal.dart';

class Services {
  static var client = http.Client();
  static var baseURL = 'http://192.168.0.117:9000/api';
  //to fetch data of events
  
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

  //to fetch data of class and subject of teacher
  static Future<List<Teacher>> fetchclassmaterial(
    {required String token}
  )async{
  try{
    var response= await http.get(Uri.parse('$baseURL/users/teacher-subjects'),
    headers: {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $token',
    },);
    final  resString = jsonDecode(response.body);
    print(resString);
    if(resString['success']?? false){
      print(resString['data']);
      return teacherclasfrom(resString['data']) ;
    }
    throw resString['error']['message']??'No Data';
    }on TimeoutException{
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
  static Future<void> postAssampletMaterialtdata( 
     {
       required String type,
       required String clas,
       required String subject,
     required String res,
     required String token, 
     required String topic,}) async {
      try{
      final bod = jsonEncode({
        "type":type,
        "file":res,
        "name":topic,
        "class":clas,
        "subject":subject,
    });
    
    var response= await http.post(Uri.parse('$baseURL/study/secondary-material'),
    headers: {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $token',
    },
    body:bod
    );
    final  resString = jsonDecode(response.body);
    if(resString['success']?? false){
      return ;
    }
    throw resString['error']['message']??'No Data';
    }on TimeoutException{
      throw 'API not Responding';
    } on SocketException {
      throw 'Can\'t connect to API';
    }
  }

//For file upload
  static Future<String>postFile(
   {
     required String name,
   required String type,
    required String token,
    required File file,
  }) async {
    try {
      var dio = Dio();
      var mimetype;
      if(file.existsSync()){
        mimetype =mime(name);
      }
    FormData formData = FormData.fromMap({
        "file":
            await MultipartFile.fromFile(file.path,contentType:mimetype ),
            "name":name,
            "type":type
    });
    //   final bod = jsonEncode({
    //     "name":fileName,
    //     "type":type,
    //     "file":formData,
    // });
    
    var response= await dio.post('$baseURL/file/upload-study-material',
  options:Options( headers : {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $token',
    },),
    data:formData
    );
    final  resString = jsonDecode(response.data);
    print(resString['success']);
    if(resString['success']?? false){
      return resString['_id'];
    }
    throw resString['error']['message']??'No Data';
    }on TimeoutException{
      throw 'API not Responding';
    } on SocketException {
      throw 'Can\'t connect to API';
    }
  }
  //for delete choosen file 
                 static Future<void> deletefile(
                     {required String token}
                 )async{
                   try{
                 var response= await http.delete(Uri.parse('$baseURL/file/study-material/$resid'),
                   headers: {
                     'Content-Type':'application/json',
                     'Accept':'application/json',
                     'Authorization':'Bearer $token',
                       },);
                      final  resString = jsonDecode(response.body);
                        print(resString['success']);
                         if(resString['success']?? false){
                            return ;
                               }
                           throw resString['error']['message']??'No Data';
                               }on TimeoutException{
                                   throw 'API not Responding';
                                }on SocketException{
                                   throw 'Can\'t connect to API';
                            }
                         }
}

  
