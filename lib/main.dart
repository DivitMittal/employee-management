import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future main() async {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: InAppWebViewPage());
  }
}

class InAppWebViewPage extends StatefulWidget {
  @override
  _InAppWebViewPageState createState() => new _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Column(children: <Widget>[
      Expanded(
        child: Container(
          child: InAppWebView(
            initialUrl: "https://apps.fliplet.com/saswa-saswa",
            initialHeaders: {},
            initialOptions: InAppWebViewWidgetOptions(
              inAppWebViewOptions: InAppWebViewOptions(
                debuggingEnabled: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStart: (InAppWebViewController controller, String url) {},
            onLoadStop: (InAppWebViewController controller, String url) {},
            onLoadError: (InAppWebViewController controller, String url,
                int code, String message) async {
              print("error $code, $message");

              controller.loadData(data: """
                    <html>
                      <head>
                        <meta charset="utf-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no">
                        <style>div {
    height: 200px;
    width: 400px;

    position: fixed;
    top: 50%;
    left: 50%;
    margin-top: -100px;
    margin-left: -125px;
}</style>
                      </head>
                      <body>
                      <div>
                      <centre>
                      <h3>Please connect to the internet</h3>
                      </centre>
                      </div>
                      </body>
                    </html>
                                      """);
            },
            onLoadHttpError: (InAppWebViewController controller, String url,
                int statusCode, String description) async {
              print("HTTP error $statusCode, $description");
            },
          ),
        ),
      ),
    ]))));
  }
}

InAppWebViewWidgetOptions({InAppWebViewOptions inAppWebViewOptions}) {}
