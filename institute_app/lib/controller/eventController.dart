// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:imstitute/models/eventModals.dart';

import '../services/services.dart';

class EventController extends GetxController {
  @override
  void onInit() {
    fetchEvent();
    super.onInit();
  }

  var isLoading = true.obs;
  var eventList = <String, List<MyEvent>>{}.obs;
  void fetchEvent() async {
    isLoading(true);
    var events = await Services.fetchEvent();
    eventList.value = events;
    isLoading(false);
  }
}
