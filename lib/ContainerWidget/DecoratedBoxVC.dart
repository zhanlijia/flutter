import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class DecoratedBoxVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("装饰容器"),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.blueAccent, Colors.orangeAccent]),
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
                color: Colors.greenAccent,
                offset: Offset(10, 10),
                blurRadius: 4)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
          child: Text("login",style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
