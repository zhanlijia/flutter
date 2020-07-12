import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class WebSocketVC extends BaseStatefulWidget{
  @override
  _WebSocketVCState createState() {
    // TODO: implement createState
    return _WebSocketVCState();
  }

}

class _WebSocketVCState extends BaseState<WebSocketVC>{

  TextEditingController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("WebSocket"),),
    );
  }

}