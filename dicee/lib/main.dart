import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Dicee'),
        ),
        body: _rowCreator(),
      ),
    );
  }

  Row _rowCreator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _imageCreator(),
        _imageCreator(),
      ],
    );
  }

  Expanded _imageCreator() {
    var dice = Random().nextInt(7 - 1);

    return Expanded(
      child: TextButton(
        onPressed: () {
          dice = Random().nextInt(7 - 1);
        },
        child: Image.asset('images/dice$dice.png'),
      ),
    );
  }
}
