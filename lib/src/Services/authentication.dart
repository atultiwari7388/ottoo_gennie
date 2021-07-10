import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ottoo_gennie/src/Auth/otp_screen.dart';

class PhoneAuthentication {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(BuildContext context, number) async {
    // context is for navigator

    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(
          credential); // after verification completed need to sign in
    };

    // create failed otp option

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException e) {
      // if verification failed it will be show the reason
      if (e.code == 'invalid-phone-number') {
        print('The Provided Phone Number is not valid');
      }
      print('The Error is ${e.code}');
    };

    // Otp sent

    final PhoneCodeSent codeSent = (String verId, int resendToken) async {
      // if otp send now new screen to should open to enter OTP.
      // so create a new screen
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpScreen()));
    } as PhoneCodeSent;

    try {
      auth.verifyPhoneNumber(
          phoneNumber: number,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          timeout: const Duration(seconds: 60),
          codeAutoRetrievalTimeout: (String verificationId) {
            print(verificationId); // will work on this later
          });
    } catch (e) {
      print('Error ${e.toString()}');
    }
  }
}
