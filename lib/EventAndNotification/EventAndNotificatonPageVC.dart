import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

import '../Util/NavigatorHelper.dart';

class EventAndNotificationPageVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var itemIcon = Icon(Icons.home);
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理与通知"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: itemIcon,
            title: Text("原始指针事件处理"),
            onTap: () {
              NavigatorHelper.go2TouchEventVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("手势识别"),
            onTap: () {
              NavigatorHelper.go2GestureVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("通知"),
            onTap: () {
              NavigatorHelper.go2NotificationVC(context);
            },
          )
        ],
      ),
    );
  }
}
