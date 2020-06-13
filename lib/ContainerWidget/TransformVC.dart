import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

///绘制时transform，所以还只是占原来layout的位置
class TransformVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("变换"),
      ),
      body: Container(
          alignment: AlignmentDirectional.center,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        color: Colors.black,
                        child: Transform(
                          alignment: Alignment.topRight,
                          transform: Matrix4.skewY(0.4),
                          child: Container(
                            color: Colors.deepOrangeAccent,
                            padding: EdgeInsets.all(8),
                            child: Text("Matrix4"),
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                      ),
                      child: Transform.translate(
                        offset: Offset(-10, -10),
                        child: Text("translate"),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                        ),
                        child: Transform.rotate(
                          angle: pi / 2,
                          child: Text("rotate"),
                        ),
                      ),
                      Text(
                        "end",
                        style: TextStyle(backgroundColor: Colors.green),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.pinkAccent),
                      child: Transform.scale(
                        scale: 1.5,
                        child: Text("scale"),
                      ),
                    ),
                    Text(
                      "end",
//                      style: TextStyle(backgroundColor: Colors.green),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                    ),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text("rotatedBox"),
                    ),
                  ),
                  Text(
                    "end",
                    style: TextStyle(backgroundColor: Colors.green),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
