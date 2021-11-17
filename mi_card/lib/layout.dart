import 'package:flutter/material.dart';

class MyScaffold {
  Widget makeScaffold() {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _makeContainers(),
        ),
      ),
    );
  }

  List<Widget> _makeContainers() {
    return <Widget>[
      Container(
        width: 100.0,
        color: Colors.red,
      ),
      _createColumnInTheCenterOfTheScreen(),
      Container(
        width: 100.0,
        color: Colors.blue,
      ),
    ];
  }

  Column _createColumnInTheCenterOfTheScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          color: Colors.yellow,
        ),
        Container(
          width: 100.0,
          height: 100.0,
          color: Colors.green,
        ),
      ],
    );
  }
}
