// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../../../colorScheme.dart';

class Notes extends StatelessWidget {
  final bool isEMpty;
  Notes({Key? key, required this.isEMpty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String dropdownValue = 'Physics';
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.vertical(top: Radius.elliptical(200, 60)),
          color: bodycolor,
        ),
        child: Column(
          children: [
            Container(
              width: 130,
              margin: EdgeInsets.only(top: 15, bottom: 20),
              transformAlignment: Alignment.center,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: const Color(0xff978DFB).withOpacity(0.2),
                ),
                iconSize: 34,
                elevation: 16,
                style: Theme.of(context).textTheme.headline2,
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
                    child: Text(
                      value,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  );
                }).toList(),
              ),
            ),
            (isEMpty)
                ? Container(
                    margin: EdgeInsets.only(top: size.height * 0.1),
                    child: Image.asset('images/nodownloads.png'),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, item) {
                        return Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          padding: EdgeInsets.all(8),
                          width: size.width * 0.85,
                          decoration: BoxDecoration(
                              color: cardcolor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Ch-1',
                                  style:
                                      TextStyle(fontSize: 25, color: bodycolor),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 15, right: 5),
                                      child: Text(
                                        'Electromagnetic Induction cbhgdvchb wdhcbjhwec jhvwchjvce ejhvwhbcew wghcvhg whgcv w hgvwc hcvw',
                                        style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .fontSize,
                                          fontWeight: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .fontWeight,
                                          color: bodycolor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'By Harry',
                                      style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .fontSize,
                                        fontWeight: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .fontWeight,
                                        color: bodycolor,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Full Chapter PDF',
                                          style: TextStyle(
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .fontWeight,
                                            color: bodycolor,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.download,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 10,
                      padding: EdgeInsets.all(20),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
