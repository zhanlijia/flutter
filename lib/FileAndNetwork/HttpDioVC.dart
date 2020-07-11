import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class HttpDioVC extends BaseStatefulWidget {
  @override
  _HttpDioVCState createState() {
    // TODO: implement createState
    return _HttpDioVCState();
  }
}

class _HttpDioVCState extends BaseState<HttpDioVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpDio"),
      ),
    );
  }
}
