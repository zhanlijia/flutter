import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class LinearLayoutVC extends BaseStatefulWidget {
  @override
  _LinearLayoutVCState createState() {
    // TODO: implement createState
    return _LinearLayoutVCState();
  }
}

class _LinearLayoutVCState extends BaseState<LinearLayoutVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局"),
      ),
      body: Column(
        //默认行居中对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(" hello world "), Text(" flutter ")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Text(" hello world "), Text(" flutter ")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[Text(" hello world "), Text(" flutter ")],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(
                " hello world ",
                style: TextStyle(fontSize: 30),
              ),
              Text(" flutter ")
            ],
          ),
          Expanded(//expanded才会占满剩下的控件，否则只是占用child控件大小

            child: Container(
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[Text(" hello world "), Text(" flutter ")],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
