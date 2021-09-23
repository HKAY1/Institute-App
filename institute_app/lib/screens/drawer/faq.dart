// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:imstitute/colorScheme.dart';
import 'package:imstitute/customeWidgets.dart';
// import 'package:imstitute/customeWidgets.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("FAQ's"),
        centerTitle: true,
      ),
      body: MyBackground(
        // decoration:BoxDecoration(gradient: LinearGradient(colors: [Theme.of(context).scaffoldBackgroundColor,cardcolor],begin:Alignment.topCenter,end: Alignment.bottomCenter,),),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          itemCount: itemData.length,
          itemBuilder: (context, item) {
            return MyExpandedList(item: item);
          },
        ),
      ),
    );
  }
}

class MyExpandedList extends StatefulWidget {
  final int item;
  const MyExpandedList({Key? key, required this.item}) : super(key: key);

  @override
  _MyExpandedListState createState() => _MyExpandedListState();
}

class _MyExpandedListState extends State<MyExpandedList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 15,
      margin: EdgeInsets.all(10),
      child: ExpansionPanelList(
        dividerColor: Colors.red,
        expandedHeaderPadding: EdgeInsets.only(bottom: 3, top: 3),
        animationDuration: Duration(milliseconds: 450),
        expansionCallback: (i, exp) {
          setState(() {
            itemData[widget.item].expanded = !exp;
          });
        },
        children: [
          ExpansionPanel(
            backgroundColor: cardcolor,
            canTapOnHeader: true,
            isExpanded: itemData[widget.item].expanded,
            headerBuilder: (context, isex) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Text(itemData[widget.item].headerItem,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            Theme.of(context).textTheme.headline3!.fontSize)),
              );
            },
            body: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text(
                  itemData[widget.item].discription,
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}

final List<ItemModel> itemData = <ItemModel>[
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
  ItemModel(
    headerItem: '  Q1. What is  Android ?',
    discription:
        " Ans-  Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
    colorsItem: Colors.green,
    // img: 'assets/images/android_img.png'
  ),
];

class ItemModel {
  bool expanded;
  final String headerItem;
  final String discription;
  final Color colorsItem;
  // String img;

  ItemModel(
      {this.expanded = false,
      required this.headerItem,
      required this.discription,
      required this.colorsItem});
}
