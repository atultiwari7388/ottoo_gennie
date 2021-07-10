import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ottoo_gennie/src/Auth/authentication.dart';
import 'package:ottoo_gennie/src/Pages/Login/login_screen.dart';
import 'package:provider/provider.dart';
// import 'package:ottoo_gennie/src/Pages/Home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'OTTO GENNIE',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ),
      );
}
