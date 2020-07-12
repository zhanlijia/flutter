import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class JsonAndModelVC extends BaseStatefulWidget{
  @override
  _JsonAndModelVCState createState() {
    // TODO: implement createState
    return _JsonAndModelVCState();
  }

}

class _JsonAndModelVCState extends BaseState<JsonAndModelVC>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Json Model"),),
    );
  }

}