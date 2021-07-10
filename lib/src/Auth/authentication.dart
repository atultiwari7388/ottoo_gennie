import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

// create google_sign_in provider

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  // Get google sign in account
  GoogleSignInAccount get user => _user!;

  // create google login message

  Future googleLogin() async {
    // Open popup for google account
    // google sign in instance
    // select user google account
    try {
      final googleUser = await googleSignIn.signIn();

      // user select an account

      if (googleUser == null) return;
      _user = googleUser;

      // call google user to fetch authentication
      final googleAuth = await googleUser.authentication;
      // then put google auth provider

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // use this credential to firebase auth

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
    // call notifier listener to update our ui

    notifyListeners();
  }

  // create logout method

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
