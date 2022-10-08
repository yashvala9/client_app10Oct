import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'webview_controller.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen(this.url, {Key? key}) : super(key: key);
  final String url;
  final _controller = Get.put(WebController());

  @override
  Widget build(BuildContext context) {
    return _buildWebView(context);
  }

  Widget _buildWebView(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: _controller.onWebViewCreated,
          onPageFinished: _controller.onWebViewLoaded,
        ),
      ),
    );
  }
}
