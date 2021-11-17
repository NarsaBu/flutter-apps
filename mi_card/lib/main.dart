import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const _fio = Text('Marat Usmanov',
      style: TextStyle(
        fontFamily: 'Pacifico',
        fontSize: 40.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ));

  static const _position = Text('FULLSTACK DEVELOPER',
      style: TextStyle(
          fontFamily: 'Source Sans Pro',
          fontSize: 20.0,
          color: Color.fromARGB(100, 178, 223, 219),
          letterSpacing: 2.5,
          fontWeight: FontWeight.bold));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _createScaffold());
  }

  Scaffold _createScaffold() {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _createColumnChildren(),
        ),
      ),
    );
  }

  List<Widget> _createColumnChildren() {
    return <Widget>[
      const CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage('images/avatar.png'),
      ),
      _fio,
      _position,
      const SizedBox(
        height: 20.0,
        width: 150.0,
        child: Divider(
          color: Color.fromARGB(200, 178, 223, 219),
        ),
      ),
      _createConnectionMethod(Icons.phone, '+7 (985) 661-20-80'),
      _createConnectionMethod(Icons.email, 'chelioschew@yandex.ru'),
    ];
  }

  Card _createConnectionMethod(IconData icon, String text) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.teal.shade900,
        ),
        title: Text(text),
      ),
    );
  }
}
