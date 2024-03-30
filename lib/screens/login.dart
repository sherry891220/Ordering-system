// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:hw4/models/catalog.dart';
import 'package:hw4/screens/catalog.dart';
import 'package:hw4/screens/catalog1.dart';
import 'package:hw4/screens/catalog2.dart';
import 'package:hw4/screens/catalog3.dart';
import 'package:hw4/models/cart.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/catalog');
                  },
                  child: Image.asset('assets/images/digest.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/catalog1');
                  },
                  child: Image.asset('assets/images/chew.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/catalog2');
                  },
                  child: Image.asset('assets/images/fiber.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/catalog3');
                  },
                  child: Image.asset('assets/images/normal.jpg'),
                ),
          ])),
        ),
      ),
    );
  }
}

/*
import 'package:final_project/second.dart';
import 'package:final_project/digestion.dart';
import 'package:final_project/chew.dart';
import 'package:final_project/normal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  //var list = [];
  //list.add(1);
}
/*
class Food {
  String _privateString = "private";
  String publicString = "public";
  var list = [1];

  String get getPrivateString => _privateString;

  //int get getMagicNumber => new LibFile2().number;
}
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Page',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('換頁Demo'),
        ),
        body: _FirstPage(),
      ),
      routes: <String, WidgetBuilder>{'/second': (_) => new SecondPage()},);
  }
}

class _FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
          child: Column(
              children: [
                GestureDetector(
                  onTap: () {Navigator.pushReplacementNamed(context, '/catalog');},
                  child: Image.asset('assets/images/digest.jpg'),
                ),
                GestureDetector(
                  onTap: () {Navigator.pushReplacementNamed(context, '/catalog');},
                  child: Image.asset('assets/images/chew.jpg'),
                ),
                GestureDetector(
                  onTap: () {Navigator.pushReplacementNamed(context, '/catalog');},
                  child: Image.asset('assets/images/unnamed.jpg'),
                ),
              ]
          )
      ),
    );
  }
}
*/