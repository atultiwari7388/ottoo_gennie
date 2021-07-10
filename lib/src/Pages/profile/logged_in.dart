import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ottoo_gennie/src/Auth/authentication.dart';
import 'package:provider/provider.dart';

class LoggedIn extends StatelessWidget {
  // access our firebaseauth
  final user = FirebaseAuth.instance.currentUser!;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // call logout button here

              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Icon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('Profile'),
            SizedBox(
              height: 32,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Name: ' + user.displayName!),
            SizedBox(
              height: 10,
            ),
            Text('Email:' + user.email!),
          ],
        ),
      ),
    );
  }
}
