// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teacher_institute/modals/teacher_eventmodal.dart';
import 'package:teacher_institute/services/event_services.dart';

class EventController extends GetxController {
  var g = GetStorage();
  @override
  void onInit() {
    fetchEvent();
    super.onInit();
  }

  
void toast({String title ='Error',String message ='Something Went wrong'}){
    Get.snackbar(
        title,
        message,colorText:Colors.black,
        maxWidth:double.maxFinite,
        margin:const EdgeInsets.all(0),
        isDismissible: true,
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
      );
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
 try{
   isLoading(true);
   var token = g.read('token')??'';
  await Services.postEvent(title:title,description: description,classes: classes,startDatefromEpoch: startDatefromEpoch,endDatefromEpoch: endDatefromEpoch,startTime: startTime,endTime: endTime,token:token);

  fetchEvent();
  isLoading(false);
  toast(message:'Event Added Successfully',title: '');
  }catch(e){
    isLoading(false);
    toast(message:e.toString());
  }
 }
}

