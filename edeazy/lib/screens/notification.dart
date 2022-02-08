// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NotificatioPage extends StatelessWidget {
  const NotificatioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificatins'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(30),
        itemCount: 10,
        separatorBuilder: (context, i) {
          return SizedBox(
            height: 10,
          );
        },
        itemBuilder: (context, item) {
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: Key("$item"),
            background: Container(
              color: Colors.red,
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Text(
                      " Delete",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                alignment: Alignment.centerRight,
              ),
            ),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                // padding: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                Image.asset('images/monkey_profile.jpg').image,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Ravi Sir',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .fontWeight,
                            ),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              IconButton(
                                color: Colors.redAccent,
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                              ),
                              Text(
                                '5 m',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .fontSize,
                                  fontWeight: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .fontWeight,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Paragraphs To Send To Your Girlfriend: Do you want to make your girlfriend happy?',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize:
                              Theme.of(context).textTheme.headline4!.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.headline4!.fontWeight,
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
