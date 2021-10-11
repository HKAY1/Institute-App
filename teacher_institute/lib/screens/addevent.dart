// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, unrelated_type_equality_checks, avoid_print

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teacher_institute/coustom/colorScheme.dart';
import 'package:teacher_institute/coustom/customeWidgets.dart';

class AddEvent extends StatefulWidget {
  
  const AddEvent({ Key? key }) : super(key: key);
  
  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  //  Event? even;
  final titlecontroller = TextEditingController();
  final discriptioncontroller = TextEditingController();
  late DateTime fromDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTime2 = TimeOfDay.now();
  final formkey = GlobalKey();
  late DateTime toDate = DateTime.now();
  late List<String?> filter;
  final List<bool> isSelect = List.filled(4, false);
  final List<String> clas = <String>[
    '9th','10th','11th','12th'
  ];
  
  
  @override
  void dispose() {
    titlecontroller.dispose();
     discriptioncontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Event'),
        
      ),
      body: MyBackground(
        child:SingleChildScrollView(
          padding: EdgeInsets.only(top: 20,left: 12),
          child: Form(
            key: formkey,
            child: Column(children: [
              SizedBox(height: 25,),
              TextFormField(
                style:TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  labelText:'Create Event',
                  border: UnderlineInputBorder(),
                ),
                onFieldSubmitted: (_){},
                validator: (title)=>title !=null && title.isEmpty ?'Title should not be empty':null,
                controller: titlecontroller,
              ),
              SizedBox(height: 18),
              Text('Choose Class'),
                Container(
              height: 50,
              color: bodycolor,
              padding: const EdgeInsets.all(6),
              child: ListView.builder(
                itemBuilder: (context, item) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: FilterChip(
                      selected: isSelect[item],
                      checkmarkColor: Colors.white,
                      selectedColor: Colors.greenAccent,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize:
                            Theme.of(context).textTheme.headline3!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.headline3!.fontWeight,
                      ),
                      label: Text(
                        clas[item],
                      ),
                      onSelected: (value) {
                        setState(() {
                          isSelect[item] = value;
                          // if(value)
                          // filter.add(clas[item].replaceAll('th', ''));
                          // else filter.removeWhere((String h){
                          //   return h == clas[item];
                          // });
                        });
                      },
                    ),
                  );
                },
                itemCount: clas.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
              SizedBox(height: 18),
              Column(
                children: [
                  Text('Choose Start Date and Time'),
                  SizedBox(height:15),
                  Row(
                    children: [
                      Expanded(child:  
                      ListTile(
                         title: Text(DateFormat('EEE, MMM d, ').format(fromDate)),
                        trailing: Icon(Icons.arrow_drop_down),
                        onTap: ()=> _selectDate(context),
                      ),
                    ),
                     Expanded(child:  
                      ListTile(
                         title: Text(selectedTime.format(context)),
                        trailing: Icon(Icons.arrow_drop_down),
                        onTap: ()=>_selectTime(context),
                      ),
                    ) 
                    ],
                  ),
                  SizedBox(height: 85,),
                  Text('Choose End Date and Time'),
                  SizedBox(height:15),
                  Row(
                    children: [
                      Expanded(child:  
                      ListTile(
                         title: Text(DateFormat('EEE, MMM d, ').format(toDate)),
                        trailing: Icon(Icons.arrow_drop_down),
                        onTap: ()=>_selectDate2(context),
                      ),
                    ),
                     Expanded(child:  
                      ListTile(
                         title: Text(selectedTime2.format(context)),
                        trailing: Icon(Icons.arrow_drop_down),
                        onTap: ()=>_selectTime1(context),
                      ),
                    ) 
                    ],
                  ),
                   TextFormField(
                     minLines: 1,
                     maxLines: 5,
                     maxLength: 300,
                style:TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  labelText:' Discription',
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (_){},
                controller: discriptioncontroller,
              ),
               TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    print(DateTime(fromDate.year,fromDate.month,fromDate.day).millisecondsSinceEpoch);
                    print(DateTime.fromMillisecondsSinceEpoch(DateTime(fromDate.year,fromDate.month,fromDate.day).millisecondsSinceEpoch));
                    print(fromDate.millisecondsSinceEpoch);
                    print(selectedTime.format(context));
                    setState(() {
                      // for(int i = 0;i<isSelect.length;i++)
                      // if(isSelect[i])
                      // filter[i] = clas[i].replaceAll('th', '');
                      filter = isSelect.asMap().entries.map((e){
                        if(e.value)
                        return clas[e.key].replaceAll('th', '');
                      }).toList();
                      filter.removeWhere((element) => element == null);
                    });
                    print(filter);
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Event'),
                ),
                ],
              )
            ],
            ),
            ),
        )
        ),
    );
  }
   Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: fromDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != fromDate)
      setState(() {
        fromDate = picked;
      });
  } 
  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: toDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != toDate)
      setState(() {
        toDate = picked;
      });
  }
  Future<void> _selectTime(BuildContext context) async {
final TimeOfDay? pickedS = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(fromDate),);

if (pickedS != null  )
  setState(() {
    selectedTime = pickedS;
  });
}
  
  Future<void> _selectTime1(BuildContext context) async {
final TimeOfDay? pickedS = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(toDate),);

if (pickedS != null  )
  setState(() {
    selectedTime2 = pickedS;
  });
 }
}
