import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebExampleFour extends StatefulWidget {
  const WebExampleFour({Key? key}) : super(key: key);

  @override
  _WebExampleFourState createState() => _WebExampleFourState();
}

class _WebExampleFourState extends State<WebExampleFour> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://www.ottoogennie.com/app.php',
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Appointment'),
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
