import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class AdvancePageVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var itemIcon = Icon(Icons.monetization_on);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: itemIcon,
            title: Text("事件处理与通知"),
            onTap: () {
              NavigatorHelper.go2EventAndNotificationVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("动画"),
            onTap: () {
              NavigatorHelper.go2AnimationPageVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("自定义组件"),
            onTap: (){
              NavigatorHelper.go2CustomizeWidgetVC(context);
            },
          )
        ],
      ),
    );
  }
}
