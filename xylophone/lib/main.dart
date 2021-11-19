import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: _createXylophone(),
      ),
    );
  }

  SafeArea _createXylophone() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _createPad(color: Colors.red, noteNumber: 1),
          _createPad(color: Colors.orange, noteNumber: 2),
          _createPad(color: Colors.yellow, noteNumber: 3),
          _createPad(color: Colors.green, noteNumber: 4),
          _createPad(color: Colors.teal, noteNumber: 5),
          _createPad(color: Colors.blue, noteNumber: 6),
          _createPad(color: Colors.purple, noteNumber: 7),
        ],
      ),
    );
  }

  Expanded _createPad({color: MaterialColor, noteNumber: int}) {
    return Expanded(
      child: Container(
        child: TextButton(
            onPressed: () {
              _player.play('note$noteNumber.wav');
            },
            child: Text('')),
        color: color,
      ),
    );
  }
}
