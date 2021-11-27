// ignore_for_file: file_names, prefer_typing_uninitialized_variables


import 'dart:io';

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
    fetchclassmaterial();
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
  var isfiledelete = true.obs;
  var issampleLoading = true.obs;
  var isfileLoading = true.obs;
  var isLoading = true.obs;
  var teacherlist = <Teacher>[].obs;
  //to fetch material
  Future<void> fetchclassmaterial() async {
    var c=g.read('token')??'';
    isLoading(true);
    var events = await Services.fetchclassmaterial(token: c);
    teacherlist.value = events;
    isLoading(false);
  }
  //to upload notes
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

  fetchclassmaterial();
  isLoading(false);
  toast(message:'Added Successfully',title: '');
  }catch(e){
    isLoading(false);
    toast(message:e.toString());
  }
 }
//to upload file
  Future<void>postFile(
    {
      required String name,
    required String type,
   required String token,
   required File file,
   }
  )async{
    try{
   isfileLoading(true);
   var token = g.read('token')??'';
   resid = await Services.postFile(name:name,token:token,type:type,file:file);
  isfileLoading(false);
  toast(message:'File Added Successfully',title: '');
  }catch(e){
    isfileLoading(false);
    toast(message:e.toString());
  }
}
// to delete choosen file
Future<void>deletefile({required String token})async{
try{
  isfiledelete(true);
  var token = g.read('token')??'';
  await Services.deletefile( token: token);
  isfiledelete(false);
  toast(message: 'File has been Deleted',title: '');
}catch(e){
  isfiledelete(false);
  toast(message: e.toString());
}
}

  
  //to upload assingnment and sample paper
 Future<void>  postAssampletMaterialtdata(
   {  
     required String res,
     required String sub,
     required String clas,
     required String type, 
     required String topic,
   }
 )async{
 try{
   issampleLoading(true);
   var token = g.read('token')??'';
  await Services.postAssampletMaterialtdata(type:type,res:resid,token:token,topic:topic,clas: clas,subject: sub);

  fetchclassmaterial();
  issampleLoading(false);
  toast(message:'Added Successfully',title: '');
  }catch(e){
    issampleLoading(false);
    toast(message:e.toString());
  }
 }
}


 


