import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class AnimationPageVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var itemIcon = Icon(Icons.title);
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: itemIcon,
            title: Text("动画示例"),
            onTap: () {
              NavigatorHelper.go2AnimationSampleVC(context);
            },
          )
        ],
      ),
    );
  }
}
