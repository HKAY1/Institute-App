// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NotificatioPage extends StatelessWidget {
  const NotificatioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),
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
                            fontSize:
                                Theme.of(context).textTheme.headline3!.fontSize,
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
                      'Paragraphs To Send To Your Girlfriend: Do you want to make your girlfriend happy? Do you want to make her cry? Do you want to make her cry with tears of joy? Then these sweet paragraphs are what you need. We give you dozens of great romantic love paragraphs that will make your girl smile even if she’s not with you. If you are looking to leave a significant impression on the one you love, then you should consider these cute paragraphs for her. Do you wish to surprise your significant other with your love sentiments? This post has some ideas on how to write something romantic for her.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize:
                            Theme.of(context).textTheme.headline4!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.headline4!.fontWeight,
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
