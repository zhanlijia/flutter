import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WebViewVC extends BaseStatefulWidget{
  @override
  _WebViewVCState createState() {
    // TODO: implement createState
    return _WebViewVCState();
  }

}

class _WebViewVCState extends BaseState<WebViewVC>{
  WebViewPlusController _controller;
  double _height = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('webview_flutter_plus Example'),
      ),
      body: WebViewPlus(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          controller.loadUrl('htmls/newcase.html');
        },
      ),
    );
  }

}