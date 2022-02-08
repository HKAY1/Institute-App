// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../coustom/colorScheme.dart';
class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Contact US'),
        centerTitle: true,
      ),
      body:Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: size.height * 0.2,
                width: size.height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              MyCard(
                size: size,
                leading: Icon(Icons.call, color: bodycolor),
                body: Text(
                  '82378239832',
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ),
              MyCard(
                size: size,
                leading: Icon(Icons.email, color: bodycolor),
                body: Text(
                  'adcjhw@gmail.com',
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ),
              MyCard(
                size: size,
                leading: Icon(Icons.location_on, color: bodycolor),
                body: Text(
                  'adcjhw@gmail.comsdjgbcdskshcvjhssdmncb sdcb hjbsd cjhdvscbn jscvsdhvcbsvdc cjhwvudwwyef',
                  style: TextStyle(
                      wordSpacing: 3,
                      letterSpacing: 1,
                      fontSize: Theme.of(context).textTheme.headline3!.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.headline2!.fontWeight,
                      color:
                          Theme.of(context).appBarTheme.titleTextStyle!.color),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.facebook,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.insert_chart,
                      size: 40,
                      color: Colors.blueAccent,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.whatshot_rounded,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }

  Widget MyCard(
      {required Widget leading, required Widget body, required Size size}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: cardcolor,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            leading,
            SizedBox(
              width: size.width * 0.1,
            ),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
