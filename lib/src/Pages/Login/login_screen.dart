import 'package:flutter/material.dart';
import 'package:ottoo_gennie/src/Pages/Home/home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  late String email;

  late String password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(color: Colors.orange),
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/Logo.png'),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Youur Email';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    fillColor: Colors.orange,
                    labelText: 'Email Address',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Your Password';
                  }
                  return null;
                },
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  fillColor: Colors.orange,
                  labelText: 'Password',
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                //forgot password screen
              },
              textColor: Colors.blue,
              child: Text('Forgot Password'),
            ),

            Container(
              decoration: BoxDecoration(
                
              ),
              width: 150,
              height: 50,
              color: Colors.orange,
              alignment: Alignment.center,
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Container(
            //   height: 50,
            //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       primary: Colors.orange,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(18.0)),
            //     ),
            //     child: Text('Login'),
            //     onPressed: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => HomeScreen(),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Container(
              child: Row(
                children: <Widget>[
                  Text('Does not have account?'),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
