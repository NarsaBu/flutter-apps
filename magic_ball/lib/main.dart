import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blueAccent,
        ),
        body: _createMagicBall(),
      ),
    );
  }

  Container _createMagicBall() {
    int ballNumber = 1 + Random().nextInt(5);

    return Container(
      alignment: Alignment.center,
      child: Expanded(
        child: TextButton(
          child: Image.asset('images/ball$ballNumber.png'),
          onPressed: () {
            setState(() {
              ballNumber = 1 + Random().nextInt(6);
            });
          },
        ),
      ),
    );
  }
}
