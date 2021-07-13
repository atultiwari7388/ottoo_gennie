import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ottoo_gennie/src/Auth/authentication.dart';
import 'package:ottoo_gennie/src/Pages/Login/login_screen.dart';
import 'package:provider/provider.dart';

class LoggedIn extends StatelessWidget {
  // access our firebaseauth
  final user = FirebaseAuth.instance.currentUser!;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Card(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        'My Profile',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Name : ' + user.displayName!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Email : ' + user.email!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.signOutAlt,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
