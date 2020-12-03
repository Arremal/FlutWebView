import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebView(
        initialUrl: "https://rojassport.com/",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController
        webViewController){
          _controller.complete(webViewController);
        }
      ),
        floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder:  (BuildContext context, AsyncSnapshot<WebViewController>
          controller){
            if(controller.hasData){
              return FloatingActionButton(
                child: Icon(Icons.ac_unit),
                onPressed: (){
                  controller.data.loadUrl("https://youtube.com");
                });
              
              }
            return Container();
            }),
        );
  }
  
}
