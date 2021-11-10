// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:teacher_institute/modals/teacher_eventmodal.dart';
import 'package:teacher_institute/services/event_services.dart';

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
 Future<void>  postEventdata(
   {
   required String title ,
   required String description,
   required List<String?> classes,
   required int startDatefromEpoch,
   required int endDatefromEpoch,
   required int startTime,
   required int endTime}
 )async{
  print(title);
  print(description);
  print(classes);
  print(startDatefromEpoch);
  print(endDatefromEpoch);
  print(startTime);
  print(endTime);
  var call = await Services.postEvent(title, description, classes, startDatefromEpoch, endDatefromEpoch, startTime, endTime);
  fetchEvent();
 }
}

