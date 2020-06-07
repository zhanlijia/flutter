import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:testflutter/BaseWidget.dart';

class FlexLayoutVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局"),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.greenAccent,
                  height: 30,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.redAccent,
                  height: 30,
                ),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 100,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blueAccent,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.pinkAccent,
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
