import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!  backgroundColor: Colors.green,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.deepOrange),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(top: 40.0),
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText(
                              'Find now',
                              textStyle: GoogleFonts.aBeeZee(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            RotateAnimatedText(
                              'Call now',
                              textStyle: GoogleFonts.abhayaLibre(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            RotateAnimatedText(
                              'Appointment now',
                              textStyle: GoogleFonts.aBeeZee(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                          totalRepeatCount: 4,
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                        // SizedBox(
                        //   child: CircleAvatar(
                        //     backgroundColor: Colors.white,
                        //     radius: 60.0,
                        //     child: Image.asset('assets/log.png'),
                        //   ),
                        // ),
                        // CircularProgressIndicator(
                        //   valueColor: AlwaysStoppedAnimation(Colors.orange),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Center(
                      child: Text(
                        'Buy Or Sell Your\n Products Online',
                        style: GoogleFonts.actor(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
