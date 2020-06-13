import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

///集合了[DecoratedBox] [ConstrainedBox] [Transform] [Padding] [Align]
class ContainerVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("容器"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.greenAccent, Colors.blueAccent],
                    center: Alignment.topLeft,
                    radius: 0.98),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(20, 20),
                      color: Colors.redAccent,
                      blurRadius: 4)
                ]),
            width: 100,
            height: 100,
            alignment: AlignmentDirectional.center,
            constraints: BoxConstraints.expand(width: 200, height: 200),
            //好像是BoxConstraints优先？？？
            child: Text(
              "520",
              style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.greenAccent,
                  fontSize: 40),
            ),
//            transform: Matrix4.rotationZ(.2),
          )
        ],
      ),
    );
  }
}
