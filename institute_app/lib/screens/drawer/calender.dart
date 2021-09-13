// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../colorScheme.dart';



class Calender extends StatefulWidget {
  const Calender({ Key? key }) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarFormat format = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Calender'),
        centerTitle: true,
       

      ),
      body: Container(
        clipBehavior: Clip.antiAlias,
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.vertical(top: Radius.elliptical(200, 60)),
          color: bodycolor,
        ),
        child: Column(
          children:[ Card(
            margin: EdgeInsets.only(top:28,left: 24,right: 24,bottom: 2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            elevation:5,
            child: TableCalendar(
              
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format){
              setState(() {
                format =_format;
              });
            },
          ),
          ),
          const SizedBox(height: 10,),
           Text(
              'Upcoming Events',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.deepPurple,
               fontSize: 20,
               fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 10,),
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
                     Container(child: Text('9Nov',style: TextStyle(fontSize: 25,color: Colors.white),)),
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
                                 Text('PTM',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                 IconButton(
                                     onPressed: () {},
                                     icon: Icon(Icons.bookmark),color: Colors.deepOrange,)
                               ],
                             )
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               );
               } ,itemCount: 10,
               padding: EdgeInsets.all(20),
               ),
            ),
          ]
        )

)
    );
  }
}