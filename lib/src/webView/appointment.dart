import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebAppointment extends StatefulWidget {
  const WebAppointment({ Key? key }) : super(key: key);

  @override
  _WebAppointmentState createState() => _WebAppointmentState();
}

class _WebAppointmentState extends State<WebAppointment> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://ottogennie.com/login.php',
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Admin Login'),
      ),
      withZoom: true,
      withJavascript: true,
      withLocalStorage: true,
      initialChild: Center(
        child: Text('Loading......'),
      ),
    );
  }
}