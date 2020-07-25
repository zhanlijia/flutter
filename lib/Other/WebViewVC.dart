import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WebViewVC extends BaseStatefulWidget {
  @override
  _WebViewVCState createState() {
    // TODO: implement createState
    return _WebViewVCState();
  }
}

class _WebViewVCState extends BaseState<WebViewVC> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

//  WebViewController _controller;

  double _height = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('webview_flutter_plus Example'),
      ),
      body: WebViewPlus(
        javascriptChannels: <JavascriptChannel>[
          _toasterJavascriptChannel(context),
        ].toSet(),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller.complete(controller);
          controller.loadUrl(
              'http://localhost:${controller.serverPort}/htmls/newcase.html');
        },
        gestureNavigationEnabled: true,
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          print("~~~~~~ ${message.message}");
          if (message.message.contains("h5finishInit")) {
            print("------------------ call js");
            var data = """
          {
	"command": "getExamList",
	"data": [{
			"casemedicalid": 1,
			"patientid": "20191219-192336",
			"examid": "20191219192336",
			"accessno": "20191219-192336",
			"name": "ererer",
			"lastname": "ererer",
			"firstname": "",
			"mi": "",
			"bod": "",
			"gender": "0",
			"height": "166",
			"heightunit": "1",
			"weight": "55",
			"weightunit": "1",
			"age": "22",
			"ageunit": "3",
			"operator": "fafafa",
			"createdate": 1576754616000,
			"examtype": "0",
			"imgcount": 2,
			"status": 0,
			"filedir": "D:/TempTransFile/csh/194",
			"imageinfo": [{
					"previewPath": "D:/TempTransFile/csh/194/1594276502940.jpg",
					"serverpath": "D:/TempTransFile/csh/194/1594276752785.mp4",
					"type": 1
				},
				{
					"previewPath": "D:/TempTransFile/csh/194/1594276503048.jpg",
					"serverpath": "D:/TempTransFile/csh/194/1594277514728.mp4",
					"type": 1
				}
			]
		},
		{
			"casemedicalid": 2,
			"patientid": "20191219-192343",
			"examid": "20191219192343",
			"accessno": "20191219-192343",
			"name": "ffgfgfdsdsee",
			"lastname": "ererer",
			"firstname": "",
			"mi": "",
			"bod": "",
			"gender": "0",
			"height": "166",
			"heightunit": "1",
			"weight": "55",
			"weightunit": "1",
			"age": "22",
			"ageunit": "3",
			"operator": "fafafa",
			"createdate": 1576754616000,
			"examtype": "0",
			"imgcount": 2,
			"status": 2,
			"filedir": "D:/TempTransFile/csh/194",
			"imageinfo": [{
					"previewPath": "D:/TempTransFile/csh/194/1594276503102.jpg",
					"serverpath": "",
					"type": 0
				},
				{
					"previewPath": "D:/TempTransFile/csh/194/1594276503169.jpg",
					"serverpath": "",
					"type": 0
				},
				{
					"previewPath": "D:/TempTransFile/csh/194/1594899518356.jpg",
					"serverpath": "",
					"type": 0
				}
			]
		},
		{
			"casemedicalid": 3,
			"patientid": "20191219-19443",
			"examid": "2019121919243",
			"accessno": "20191219-19443",
			"name": "ffgfgf",
			"lastname": "",
			"firstname": "",
			"mi": "",
			"bod": "",
			"gender": "0",
			"height": "166",
			"heightunit": "1",
			"weight": "55",
			"weightunit": "1",
			"age": "22",
			"ageunit": "3",
			"operator": "fafafa",
			"createdate": 1576754616000,
			"examtype": "0",
			"imgcount": 2,
			"status": 2,
			"filedir": "D:/TempTransFile/csh/195",
			"imageinfo": [{
					"previewPath": "D:/TempTransFile/csh/195/1594276794464.jpg",
					"serverpath": "",
					"type": 0
				},
				{
					"previewPath": "D:/TempTransFile/csh/195/1594276794553.jpg",
					"serverpath": "",
					"type": 0
				},
				{
					"previewPath": "D:/TempTransFile/csh/195/1594276794646.jpg",
					"serverpath": "",
					"type": 0
				}
			]
		}
	]
}
          """;
            _controller.future.then(
                (value) => value.evaluateJavascript("flutter_recv($data)"));
          }
//          Scaffold.of(context).showSnackBar(
//            SnackBar(content: Text(message.message)),
//          );
        });
  }
}
