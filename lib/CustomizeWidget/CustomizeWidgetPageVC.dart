import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class CustomizeWidgetPageVC extends BaseStatelessWidget {
  var itemIcon = Icon(Icons.account_balance);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义组件"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: itemIcon,
            title: Text("组合现有组件"),
            onTap: () {
              NavigatorHelper.go2MakeUpWidgetVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text('组合实例'),
            onTap: () {
              NavigatorHelper.go2MakeUpWidgetInstanceVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("自绘组件"),
            onTap: () {
              NavigatorHelper.go2CustomPaintVC(context);
            },
          )
        ],
      ),
    );
  }
}
