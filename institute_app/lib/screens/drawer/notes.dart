// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../../colorScheme.dart';


class Notes extends StatelessWidget {
     Notes({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    String dropdownValue = 'Physics';
      return 
Scaffold(
      
      body: Container(
       clipBehavior: Clip.antiAlias,
       height: size.height,
       width: size.width,
       decoration: BoxDecoration(
         borderRadius:const
             BorderRadius.vertical(top: Radius.elliptical(200, 60)),
         color: bodycolor,
       ),
       child: 
       Column(children: [
           Container(width: 130,
           margin: EdgeInsets.only(top: 15,bottom: 20),
            transformAlignment: Alignment.center,
            height:45,
            
            alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
               value: dropdownValue,
               icon:  Icon(Icons.arrow_drop_down,color: const Color(0xff978DFB).withOpacity(0.2),),
               iconSize: 34,
               elevation: 16,
               style:  Theme.of(context).textTheme.headline2,
               underline: Container(
                 height: 2,
                 color: Colors.transparent,
               ),
               // onChanged: (String? newValue) {
               //   setState(() {
               //     dropdownValue = newValue!;
               //   });
                 
               items: <String>['Physics', 'Chemistry', 'Math', 'Biology']
                   .map<DropdownMenuItem<String>>((String value) {
                 return DropdownMenuItem<String>(
                   value: value,
                   child: Text(value,style: Theme.of(context).textTheme.headline3,),
                 );
               }).toList(),),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context,item){
                return Container(
                     
                     margin: EdgeInsets.only(top: 10, bottom: 10),
                     padding: EdgeInsets.all(8),
                     width: size.width * 0.85,
                     decoration: BoxDecoration(
                         color: cardcolor,
                         borderRadius: BorderRadius.circular(20)),
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Container(child: Text('Ch-1',style: TextStyle(fontSize: 25,color: Colors.white),)),
                         Divider(
                           thickness: 1,
                           height: 1
                         ),
                         Flexible(
                           child: Container(
                             
                             margin: EdgeInsets.only(left: 8),
                             padding: EdgeInsets.all(5),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   mainAxisAlignment:
                                       MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text('Physics',style: TextStyle(color: Colors.white),),
                                     IconButton(
                                         onPressed: () {},
                                         icon: Icon(Icons.hearing),color: Colors.white,)
                                   ],
                                 )
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   );
                },
                itemCount: 10,
                padding:EdgeInsets.all(20)),
            )
       ],)
       )

      );
    }
  }
