import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebExampleThree extends StatefulWidget {
  const WebExampleThree({ Key? key }) : super(key: key);

  @override
  _WebExampleThreeState createState() => _WebExampleThreeState();
}

class _WebExampleThreeState extends State<WebExampleThree> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://ottogennie.com/contact.php',
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Contact Us'),
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