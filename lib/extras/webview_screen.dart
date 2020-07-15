import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final Text webViewTitle;
  final String webViewUrl;

  WebViewScreen({this.webViewTitle, this.webViewUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: webViewTitle,
      ),
      body: WebView(
        initialUrl: webViewUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
