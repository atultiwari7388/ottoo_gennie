import 'package:flutter/material.dart';
import 'package:ottoo_gennie/src/Services/authentication.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  bool validate = false;
  var countryCodeController = TextEditingController(text: '+91');
  var phoneNumberController = TextEditingController();

  get number => null;

  showAlertBox(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).errorColor),
          ),
          SizedBox(
            width: 8,
          ),
          Text('Please Wait')
        ],
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  // Phone Authentication here

  PhoneAuthentication _service = PhoneAuthentication();

  // String

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Phone Verification',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Enter Your Phone Number',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'We Will send confirmation code to your phone',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: countryCodeController,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Country',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    autofocus: true,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberController,
                    onChanged: (value) {
                      if (value.length == 10) {
                        setState(() {
                          validate = true;
                        });
                      }
                      if (value.length < 10) {
                        setState(() {
                          validate = false;
                        });
                      }
                    },
                    enabled: true,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter Your Number',
                      hintStyle:
                          TextStyle(fontSize: 12, color: Colors.blueGrey),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AbsorbPointer(
            absorbing: validate == true ? false : true,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: validate == true
                    ? MaterialStateProperty.all(Colors.green) // if validate
                    : MaterialStateProperty.all(Colors.red), // if not validate
              ),
              onPressed: () {
                // need to show loading here
                showAlertBox(context);

                _service.verifyPhoneNumber(context, number);
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
