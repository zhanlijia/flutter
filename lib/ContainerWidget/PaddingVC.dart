import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class PaddingVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Padding"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            color: Colors.blueAccent,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.redAccent,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("EdgeInsets only " * 5),
                  ),
                ),
                Container(
                  color: Colors.greenAccent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Text("EdgeInsets symmetric"),
                  ),
                ),
                Container(
                  color: Colors.orangeAccent,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 20, 25),
                    child: Text("EdgeInsets fromLTRB"),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
