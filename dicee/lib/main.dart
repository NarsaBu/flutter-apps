import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: _createRow(),
      ),
    );
  }

  Center _createRow() {
    return Center(
      child: Row(
        children: [
          _createDice(),
          _createDice(),
        ],
      ),
    );
  }

  Expanded _createDice() {
    int diceNumber = 1 + Random().nextInt(6);

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextButton(
          child: Image.asset('images/dice$diceNumber.png'),
          onPressed: () {
            setState(() {
              diceNumber = 1 + Random().nextInt(6);
            });
          },
        ),
      ),
    );
  }
}
