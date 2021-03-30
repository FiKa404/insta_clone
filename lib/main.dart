import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/bottom_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var stores = [
    {
      'avatar': 'assets/Avatars/avatar.jpg',
    },
    {
      'avatar': 'assets/Avatars/avatar1.jpg',
    },
    {
      'avatar': 'assets/Avatars/avatar2.jpg',
    },
    {
      'avatar': 'assets/Avatars/avatar3.jpg',
    },
    {
      'avatar': 'assets/Avatars/avatar4.jpg',
    },
    {
      'avatar': 'assets/Avatars/avatar5.jpg',
    },
  ];

  var data = [
    {
      'avatar': 'assets/Avatars/avatar1.jpg',
      'name': 'Ahmed AbdelZaher',
      'likes': '85',
      'comments': '684',
      'post': 'assets/Posts/image1.jpg'
    },
    {
      'avatar': 'assets/Avatars/avatar3.jpg',
      'name': 'Karim Magdy',
      'likes': '42',
      'comments': '542',
      'post': 'assets/Posts/image3.png'
    },
    {
      'avatar': 'assets/Avatars/avatar5.jpg',
      'name': 'Mohamed Alaa',
      'likes': '15',
      'comments': '512',
      'post': 'assets/Posts/image.png'
    },
    {
      'avatar': 'assets/Avatars/avatar2.jpg',
      'name': 'Abode Alaa',
      'likes': '346',
      'comments': '123',
      'post': 'assets/Posts/image2.jpg'
    },
    {
      'avatar': 'assets/Avatars/avatar4.jpg',
      'name': 'Waleed Mohamed',
      'likes': '23',
      'comments': '564',
      'post': 'assets/Posts/image4.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Icon(Icons.photo_camera_outlined, size: 30),
                ),
                SizedBox(
                  width: size.width * 0.485,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Icon(
                    Icons.live_tv_rounded,
                    size: 30,
                    color: Color(0xffff9696),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Transform.rotate(
                      angle: -35 * (pi / 180),
                      child: Icon(
                        Icons.send,
                        size: 30,
                        color: Color(0xFF568df5),
                      )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.05, bottom: size.height * 0.01),
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/logo.png',
                height: size.height * 0.08,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: stores.length,
                  itemBuilder: (_, i) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 5)
                          ]),
                      margin: i == 0
                          ? EdgeInsets.only(left: size.width * 0.05, right: 10)
                          : EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          stores[i]['avatar'],
                          height: 60,
                          width: 60,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, i) {
                  return Container(
                    margin: i == 0
                        ? EdgeInsets.symmetric(vertical: size.height * 0.04)
                        : EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: size.width * 0.1),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      data[i]['avatar'],
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Text(
                                    data[i]['name'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: size.width * 0.1),
                              child: Icon(Icons.more_horiz),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: size.height * 0.02),
                          width: size.width * 0.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(data[i]['post']),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: size.width * 0.095,
                                  right: size.width * 0.05),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite_border_rounded),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Text('${data[i]['likes']}')
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.mode_comment_outlined),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Text('${data[i]['comments']}')
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: size.width * 0.46,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.bookmark_border_rounded),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              end: Alignment.bottomLeft,
              begin: Alignment.topRight,
              colors: [
                Color(0xffb43a9a),
                Color(0xffffb13f),
              ]
            )
          ),
            child: Icon(
          Icons.add,
          color: Colors.white,
        )),
      ),
      bottomNavigationBar: FABBottomAppBar(
        notchedShape: CircularNotchedRectangle(),
        backgroundColor: Colors.white,
        items: [
          FABBottomAppBarItem(
            iconData: Icons.home,
          ),
          FABBottomAppBarItem(
            iconData: Icons.search,
          ),
          FABBottomAppBarItem(
            iconData: Icons.favorite_border_sharp,
          ),
          FABBottomAppBarItem(
            iconData: Icons.person_outlined,
          ),
        ],
      ),
    );
  }
}