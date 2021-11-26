// ignore_for_file: file_names, prefer_typing_uninitialized_variables


import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teacher_institute/modals/teacher_studymodal.dart';
import 'package:teacher_institute/services/event_services.dart';
  

  var resid;
class MaterialControler extends GetxController {
  var g = GetStorage();
  @override
  void onInit() {
    fetchmaterial();
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
  var teacherlist = <Teacher>[].obs;
  Future<void> fetchmaterial() async {
    var c=g.read('token')??'';
    isLoading(true);
    var events = await Services.fetchmaterial(token: c);
    teacherlist.value = events;
    isLoading(false);
  }
 Future<void>  postMaterialtdata(
   {  required String res,
     required String clas,
     required String subject,
      String? chapno,
      String? chapname,
     required String type,
     required String topic,
   }
 )async{
 try{
   isLoading(true);
   var token = g.read('token')??'';
  await Services.postNotesMaterialtdata(res:resid,token:token,chapname:chapname,chapno:chapno,topic:topic,clas: clas,subject: subject);

  fetchmaterial();
  isLoading(false);
  toast(message:'Added Successfully',title: '');
  }catch(e){
    isLoading(false);
    toast(message:e.toString());
  }
 }
}

class UploadMaterialControler extends GetxController {
  var g = GetStorage();
  

  
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
  
  var eventList = <Teacher>[].obs;
  void fetchmaterial() async {
    var c=g.read('token')??'';
    isLoading(true);
    var events = await Services.fetchmaterial(token: c);
    eventList.value = events;
    isLoading(false);
  }
 Future<void>  postAssampletMaterialtdata(
   {  
     required String res,
     required String sub,
     required String clas,
     required String token, 
     required String topic,
   }
 )async{
 try{
   isLoading(true);
   var token = g.read('token')??'';
  await Services.postAssampletMaterialtdata(res:resid,token:token,topic:topic,clas: clas,subject: sub);

  fetchmaterial();
  isLoading(false);
  toast(message:'Added Successfully',title: '');
  }catch(e){
    isLoading(false);
    toast(message:e.toString());
  }
 }
}

class UploadFilecontroller extends GetxController{
var g = GetStorage();

  var isLoading = true.obs;
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
  Future<void>postFile(
    {
    required String type,
   required String token,
   required File file,
   }
  )async{
    try{
   isLoading(true);
   var token = g.read('token')??'';
   resid = await Services.postFile(token:token,type:type,file:file);
  isLoading(false);
  toast(message:'File Added Successfully',title: '');
  }catch(e){
    isLoading(false);
    toast(message:e.toString());
  }
}
}

