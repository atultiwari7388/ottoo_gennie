import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ottoo_gennie/src/Pages/Home/home_screen.dart';
import 'package:ottoo_gennie/src/Pages/profile/logged_in.dart';
import 'package:ottoo_gennie/src/Services/store_location.dart';
import 'package:ottoo_gennie/src/webView/Example4.dart';

class DrawerSide extends StatelessWidget {
  // const DrawerSide({Key? key}) : super(key: key);

  // void Function()?;

  final user = FirebaseAuth.instance.currentUser!;

  Widget listTile(
      {required IconData icon, required String title, Null Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    // backgroundColor: Colors.red,
                    radius: 20,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome\n' + user.displayName!),
                      SizedBox(
                        height: 5,
                      ),

                      SizedBox(
                        height: 7,
                      ),
                      Text(user.email!),

                      //! Create Login Button in Drawer Header

                      // Container(
                      //   height: 30,
                      //   child: OutlineButton(
                      //     onPressed: () {},
                      //     child: Text('Login'),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(15),
                      //       side: BorderSide(width: 2),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),

// Call HeaderList tile function

            listTile(
              icon: Icons.home_filled,
              title: "Home",
            ),
            listTile(
                icon: Icons.person_outline,
                title: "My Account",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoggedIn()));
                }),
            listTile(
                icon: Icons.hail_rounded,
                title: "Appointment",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => WebExampleFour()));
                }),
            // listTile(icon: Icons.favorite_outline, title: "Wishlist"),
            listTile(
              icon: Icons.location_on_sharp,
              title: "Find Location",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => StoreLocation()));
              },
            ),
            // listTile(icon: Icons.format_quote_sharp, title: "FAQS"),
            SizedBox(height: 10),
            Container(
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact Support'),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      // Text('call us:', style: TextStyle(color: Colors.black, fontSize: 20),),
                      Icon(Icons.call),
                      SizedBox(
                        width: 10,
                      ),
                      Text('+91 63636 79794'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      // Text('Service:', style: TextStyle(color: Colors.black, fontSize:20),),
                      Icon(Icons.miscellaneous_services_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Mon - Sun 24/7 Services'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
