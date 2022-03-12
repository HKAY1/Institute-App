// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:edeazy_teacher/animation/live_card_animation.dart';
import 'package:edeazy_teacher/coustom/colorScheme.dart';
import 'package:edeazy_teacher/modals/lecture_modal.dart';
import 'package:flutter/material.dart';
import '../controller/lectures_controller.dart';
import '../coustom/customeWidgets.dart';
import 'drawer/custome_drawer.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 late Lecture control;
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    control = Lecture();
    super.initState();
    
  }

  @override
  void dispose() {
    scrollController.dispose();
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomeDrawer(),
      appBar: AppBar(
        title: Text(
          'Institute',
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              },
              icon: Icon(Icons.notifications))
        ],
      ),
      body: StreamBuilder<List<Lectures>>(
        stream: control.stateStream,
        initialData: [],
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return CustomeLoading(
              color: Colors.blueAccent,
            );
          }
          else if(snapshot.connectionState == ConnectionState.done ||snapshot.connectionState == ConnectionState.active ){
            if(snapshot.hasError){
              return Center(
                child:Text(snapshot.error.toString()) ,
              );
            }
            else if(snapshot.hasData){
              if(snapshot.data==null){
                return Center(
                  child: Text("Something Went Wrong",
                  style: Theme.of(context).textTheme.headline2,
                  ),
                );
              }
              return CustomScrollView(
                controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.only(top: 20.0, bottom: 20, left: 20),
                      //   child: Text(
                      //     ' Live Class',
                      //     style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.red),
                      //   ),
                      // ),
                      // MyCard(data: snapshot.data![0],), 
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                        child: Text(
                          'Today Classes',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, item) {
                    return card(snapshot.data![item]);
                  },
                  childCount: snapshot.data!.length,
                ),
              ),
            ],
          );
            }
            else {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
          }
          return Center(
            child: Text('Connection---Error'),
          );
        }
      ),
    );
  }
  Widget card(Lectures data){
    // var time = DateTime.now();
    Object meeting={};
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: cardcolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               SizedBox(width: 8),
               CircleAvatar(
                 minRadius: 40,
                 maxRadius: 50,
                 backgroundImage: Image.asset('images/monkey_profile.jpg').image,
               ),
               Expanded(
                 child: Container(
                   margin: EdgeInsets.only(left: 8),
                   padding:
                       EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                   decoration: BoxDecoration(
                       color: Colors.white, borderRadius: BorderRadius.circular(20)),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'Class${data.lectureClass} Batch${data.batch}',
                         style: Theme.of(context).textTheme.headline4,
                       ),
                       SizedBox(height: 10),
                       Text(
                         data.subject,
                         style: Theme.of(context).textTheme.headline3,
                       ),
                       SizedBox(height: 10),
                       Text(
                         'By${data.teacher}',
                         style: Theme.of(context).textTheme.headline4,
                       ),
                       SizedBox(height: 10),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                            data.startTime.toString(),
                             style: Theme.of(context).textTheme.headline5,
                           ),
                           StreamBuilder<bool>(
                                 stream: Stream.periodic(Duration(seconds:10),(i){
                                  var now = TimeOfDay.now();
                                  double n = now.hour + now.minute/60;
                                   var start = TimeOfDay.fromDateTime(data.startTime?? DateTime(1990));
                                   double s = start.hour + start.minute/60;
                                   var end = TimeOfDay.fromDateTime(data.endTime?? DateTime(1990));
                                   double e = end.hour + end.minute/60;
                                   if(
                                       (n < e) && (n>=s)){
                                      return true;
                                 }
                                 return false;
                                 }),
                                 initialData: false,
                                 builder: (context, snapshot) {
                                   if((snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done )&& (snapshot.data == true)){
                                     return LiveAnimation(
                                       minRadius:20,
                                       ripplesCount:4,
                                       repeat: true,
                                       animate: snapshot.hasData,
                                       color: Colors.blueAccent,
                                       child: TextButton(
                                         style: TextButton.styleFrom(
                                             backgroundColor: cardcolor,
                                             shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(20))),
                                         onPressed: () {
                                          meeting={
                                            "meetLink":"meet.jitsii.si",
                                            "roomName":'subject',
                                            "lectureId":data.id
                                          };
                                          control.startLecture(meeting);
                                           Navigator.push(
                                           context,
                                           MaterialPageRoute(
                                             builder: (context) => Meeting(),
                                           ),
                                         );
                                         },
                                         child: Text(
                                           'Start',
                                           style: TextStyle(color: Colors.white),
                                         ),
                                       ),
                                     );
                                   }
                                  //  return Text('data');
                                   return TextButton(
                                       style: TextButton.styleFrom(
                                           backgroundColor: Colors.grey,
                                           shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(20))),
                                       onPressed: () {},
                                       child: Text(
                                         'Start',
                                         style: TextStyle(color: Colors.white),
                                       ),
                                     ); 
                                 } 
                               )
                         ],
                      ),
                    ],
                   
                  ),
                ),
              ),
            ],
      )
    );
  }
}


