// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, unrelated_type_equality_checks, avoid_print


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teacher_institute/coustom/colorScheme.dart';
import 'package:teacher_institute/coustom/customeWidgets.dart';

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
  late List<String?> filter;
  late List<String?> choose;
  final List<String> type = <String>['Notes','Assignment','Test Series'];
  final List<bool> isSelect = List.filled(4, false);
  final List<bool> choice = List.filled(3, false);
  final List<String> clas = <String>[
    '9th','10th','11th','12th'
  ];
  int typeIndex=0;
  
  
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
                  labelText:'Chapter No.',
                  hintText: 'eg :- 1 ',
                  border: UnderlineInputBorder(),
                ),
                onFieldSubmitted: (_){},
                validator: (title)=>title !=null && title.isEmpty ?'Title should not be empty':null,
                controller: chaptercontroller,
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
              Text('Choose Type'),
              Container(
              height: 50,
              color: bodycolor,
              padding: const EdgeInsets.all(6),
              child: ListView.builder(
                itemBuilder: (context, item) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: ChoiceChip(
            label: Text(type[item]),
            selected: choice[item] ,
            selectedColor: Colors.red,
            onSelected: (selected) {
              setState(() {
                typeIndex = selected ? item : 0;
                choice[item] = selected;
              });
            },
            backgroundColor: Colors.green,
            labelStyle: TextStyle(color: Colors.white),
          ));
                  
                },
                itemCount: type.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
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
                      // for(int i = 0;i<isSelect.length;i++)
                      // if(isSelect[i])
                      // filter[i] = clas[i].replaceAll('th', '');
                      filter = isSelect.asMap().entries.map((e){
                        if(e.value)
                        return clas[e.key].replaceAll('th', '');
                      }).toList();
                      filter.removeWhere((element) => element == null);
                       choose = choice.asMap().entries.map((e){
                         if(e.value)
                        return type[e.key];
                      }).toList();
                      choose.removeWhere((element) => element == null);
                    });
                    print(filter);
                    print(choose);
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
}