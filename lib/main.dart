import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ottoo_gennie/src/Auth/phone_auth_screen.dart';
import 'package:ottoo_gennie/src/Pages/Login/login_screen.dart';
// import 'package:ottoo_gennie/src/Pages/Home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTTO GENNIE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
