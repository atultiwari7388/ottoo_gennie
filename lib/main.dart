import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ottoo_gennie/src/Auth/authentication.dart';
import 'package:ottoo_gennie/src/Pages/profile/profile_page.dart';
import 'package:ottoo_gennie/src/splashScreen/splash_screen.dart';
import 'package:provider/provider.dart';
// import 'package:ottoo_gennie/src/Pages/Home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: FutureBuilder(
          // Replace the 3 second delay with your initialization code:
          future: Future.delayed(Duration(seconds: 7)),
          builder: (context, AsyncSnapshot snapshot) {
            // Show splash screen while waiting for app resources to load:
            if (snapshot.connectionState == ConnectionState.waiting) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false, home: SplashScreen());
            } else {
              // Loading is done, return the app:
              return MaterialApp(
                themeMode: ThemeMode.system,
                title: 'Ottoo Gennie',
                debugShowCheckedModeBanner: false,
                home: ProfilePage(),
              );
            }
          },
        ),
      );
}
