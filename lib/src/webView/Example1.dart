import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebExample1 extends StatefulWidget {
  const WebExample1({ Key? key }) : super(key: key);

  @override
  _WebExample1State createState() => _WebExample1State();
}

class _WebExample1State extends State<WebExample1> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://ottogennie.com/about.php',
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('About Page'),
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