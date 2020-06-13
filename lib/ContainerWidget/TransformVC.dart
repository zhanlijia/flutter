import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class TransformVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("变换"),),
      body: Container(
        child: Transform(transform: Matrix4.skewY(0.4), child: Container(
          color: Colors.deepOrangeAccent,
          padding: EdgeInsets.all(8),
          child: Text("hello world"),
        ),),
      ),
    );
  }

}