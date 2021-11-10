// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, unrelated_type_equality_checks, avoid_print


import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class AddMaterial extends StatefulWidget {
  
  const AddMaterial({ Key? key }) : super(key: key);
  
  @override
  State<AddMaterial> createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {
  //  Event? even;
  final chaptercontroller = TextEditingController();
  final discriptioncontroller = TextEditingController();
  final formkey = GlobalKey();
 String choose = 'Notes';
  final List<String> type = <String>['Notes','Assignment','Test Series'];
  int selectedIndex=0; 
  
  
  @override
  void dispose() {
    chaptercontroller.dispose();
     discriptioncontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create Material'),
        
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20,left: 12),
          child: Form(
            key: formkey,
            child: Column(
              children: [
              SizedBox(height: 25,),
              TextFormField(
                style:TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  labelText:'Chapter No.',
                  hintText: 'eg :- 1 ',
                  border: UnderlineInputBorder(),
                ),
                onFieldSubmitted: (_){},
                validator: (title)=>title !=null && title.isEmpty ?'Title should not be empty':null,
                controller: chaptercontroller,
              ),
              SizedBox(height: 18),
             
              Column(
                children: [
                   TextFormField(
                     minLines: 1,
                     maxLines: 5,
                     maxLength: 50,
                style:TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  labelText:' Chapter Name',
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (_){},
                controller: discriptioncontroller,
              ),
                  SizedBox(height:15),
                   Text('Choose Type'),
              Container(
              height: 50,
              // color: bodycolor,
              padding: const EdgeInsets.all(6),
              child: ListView.builder(
                itemBuilder: (context, item) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: ChoiceChip(
            label: Text(type[item]),
            selected: selectedIndex == item ,
            selectedColor: Colors.green,
            onSelected: (selected) {
              if(selected){
                selectedIndex = item;
                setState(() {
                  choose = type[item];
                });
              }
              print(choose);
            },
            backgroundColor: Colors.red,
            labelStyle: TextStyle(color: Colors.white),
          ));
                  
                },
                itemCount: type.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Visibility(
              visible: selectedIndex == 0,
              child:TextFormField(
                     minLines: 1,
                     maxLines: 5,
                     maxLength: 50,
                style:TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  labelText:' Topic Name',
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (_){},
                controller: discriptioncontroller,
              ), ),
            SizedBox(height:15),
               TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                  ),
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(
                       allowedExtensions: ['jpg', 'pdf'],
                    );
                       if (result == null) {
                     return;
                     }
                     final file = result.files.first;
                     OpenFile.open(file.path!);
                  },
                  icon: Icon(Icons.upload_rounded),
                  label: Text('Upload File'),
                ),
            SizedBox(height:15),
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
                    setState(() {
                    });
                    print(choose);
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Material'),
                ),
                ],
              )
            ],
            ),
            ),
        ),
        
    );
  }
}