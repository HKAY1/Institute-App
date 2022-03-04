import 'dart:async';
import 'package:edeazy/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as i_o;
import 'package:get_storage/get_storage.dart';

class Lecture extends GetxController {
  var isLoading = true.obs;
  var lectures = ''.obs;
  final storage = GetStorage();
  late i_o.Socket socket;
  final _stateStreamController = StreamController<String>();
  // final _eventStreamController = StreamController<String>();

  StreamSink<String> get _stateSink => _stateStreamController.sink;
  Stream<String> get stateStream => _stateStreamController.stream;

  @override
  void onInit() {
    fetchLectures();
    super.onInit();
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
    var payload = storage.read('id');
    print('Connecting to Socket with token $payload');
    socket = i_o.io(
      'http://192.168.1.25:2331',
      {
        'transports': ['websocket'],
        'autoConnect': false,
      },
    );
    socket.connect();
    socket.onConnect((_) {
      socket.emit('meeting:join-room', payload);
      debugPrint('connected to websocket with id $_');
      _stateSink.add('data'.toString());
    });
    socket.onConnectError((err) {
      debugPrint('error ++> $err');
      _stateSink.addError('Connection Error');
    });
    socket.on('handler:error', (err) {
      debugPrint('in no token ${err.toString()}');
      _stateSink.addError(err.toString());
    });
    socket.on('room:msg', (data) {
      debugPrint('in success ${data.toString()}');
      _stateSink.add(data.toString());
    });
    socket.onConnectTimeout((err) {
      debugPrint('data ==> $err');
      _stateSink.addError(err.toString());
    });
  }

  void fetchLectures() async {
    try {
      isLoading(true);
      var data =
          await Services.fetchLectures(token: storage.read('token') ?? '');
      lectures(data);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      toast(message: e.toString());
    }
    isLoading(false);
  }

  @override
  void dispose() {
    _stateStreamController.close();
    socket.dispose();
    super.dispose();
  }
}
