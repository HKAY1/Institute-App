import 'dart:async';
import 'dart:convert';
import 'package:edeazy_teacher/modals/lecture_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as i_o;
import 'package:get_storage/get_storage.dart';

class Lecture{
  final storage = GetStorage();
  late i_o.Socket socket;
  final _stateStreamController = StreamController<List<Lectures>>();
  // final _eventStreamController = StreamController<String>();

  StreamSink<List<Lectures>> get _stateSink => _stateStreamController.sink;
  Stream<List<Lectures>> get stateStream => _stateStreamController.stream;

  void startLecture(Object meet){
    socket.emit("meeting:start",meet);
  }

  void toast(
      {String title = 'Error', String message = 'Something Went Wrong'}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      colorText: Colors.white,
      maxWidth: double.maxFinite,
      margin: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  Lecture() {
    var payload = storage.read('token');
    socket = i_o.io(
      // 'https://pure-crag-69424.herokuapp.com',
      'http://192.168.1.25:2331',
      {
        'transports': ['websocket'],
        'autoConnect': false,
        'auth':{'token':payload},
      },
    );
    socket.connect();
    socket.onConnect((_) {
      debugPrint('connected to websocket with id $_');
      _stateSink.add([]);
    });
    socket.on('today:lectures', (data) { 
      print('data----$data');
      var lectures = <Lectures>[];
       lectures = lecturesFromJson(data);
      _stateSink.add(lectures);

    });
    
    socket.on('handler:error', (error) => debugPrint(error));
    socket.onConnectError((err) {
      debugPrint('error ++> $err');
      _stateSink.addError('Connection Error');
    });
    socket.onError((err) {
      debugPrint('on error $err');
      _stateSink.addError('Connection Error');
      // socket.io.disconnect()..connect();
    });
    // socket.on('room:msg', (data) {
    //   debugPrint('in success ${data.toString()}');
    //   _stateSink.add(data);
    // });
    socket.onConnectTimeout((err) {
      debugPrint('data ==> $err');
      _stateSink.addError(err.toString());
    });
  }

  void dispose() {
    _stateStreamController.close();
    socket.dispose();
  }
}
