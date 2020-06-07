import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class StackLayoutVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("层叠布局"),
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Colors.blueAccent,
            ),
            Positioned(//被遮挡
              left: 18,
              child: Container(
                color: Colors.orangeAccent,
                child: Text("hello left"),
              ),
            ),
            Container(
              color: Colors.redAccent,
              child: Text("hello world"),
            ),
            Positioned(
                top: 18,
                child: Container(
                  color: Colors.greenAccent,
                  child: Text("hello top"),
                )),
          ],
        ));
  }
}
