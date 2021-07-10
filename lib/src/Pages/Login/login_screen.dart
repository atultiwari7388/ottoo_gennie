import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ottoo_gennie/src/Auth/authentication.dart';
import 'package:ottoo_gennie/src/Pages/Home/home_screen.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Image.asset('assets/Logo.png'),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    'Sign Up Here',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.orange,
                      prefixIcon: Icon(Icons.mail_outline),
                      border: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: 'Email Address',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    decoration: InputDecoration(
                      fillColor: Colors.orange,
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: 'Enter your Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // login button

                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange)),
                    onPressed: () {
                      setState(() {
                        _submit();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      });
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text('-- OR --'),
                  SizedBox(
                    height: 10,
                  ),

                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        minimumSize: Size(double.infinity, 50)),
                    onPressed: () {
                      // call googleLogin in authentication
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);

                      provider.googleLogin();
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    label: Text('Sign Up with Google'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
