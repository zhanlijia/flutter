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
        javascriptChannels: <JavascriptChannel>[///JS和Flutter通信的Channel；
          _alertJavascriptChannel(context),
        ].toSet(),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller = controller;
          controller.loadUrl('htmls/newcase.html');
          var data = """
          {
	"command":"getExamList",		
	"data":{	
	}
}

          """;
          controller.evaluateJavascript("flutter_recv($data)");
        },
      ),
    );
  }

  ///js与flutter交互
  JavascriptChannel _alertJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'otherJsMethodCall',//invoke要和网页协商一致
        onMessageReceived: (JavascriptMessage message) {
          print("~`````~"+message.message);

        });
  }
}