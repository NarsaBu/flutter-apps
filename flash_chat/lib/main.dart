import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screen/chat_screen.dart';
import 'package:flash_chat/screen/login_screen.dart';
import 'package:flash_chat/screen/registration_screen.dart';
import 'package:flash_chat/screen/welcome_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() {
    print('firebase initialized');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
