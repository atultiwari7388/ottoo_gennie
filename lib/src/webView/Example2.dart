import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebExample2 extends StatefulWidget {
  const WebExample2({ Key? key }) : super(key: key);

  @override
  _WebExample2State createState() => _WebExample2State();
}

class _WebExample2State extends State<WebExample2> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://ottogennie.com/services.php',
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Service Page'),
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