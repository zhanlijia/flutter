import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/DialogHelper.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class FunctionWidgetPageVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemIcon = Icon(Icons.alarm);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("功能性组件"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: itemIcon,
            title: Text("导航返回拦截"),
            onTap: () {
              NavigatorHelper.go2WillPopScopeVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("数据共享"),
            onTap: () {
              NavigatorHelper.go2InheritedWidgetVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("跨组件数据共享"),
            onTap: () {
              NavigatorHelper.go2ProviderVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("颜色和主题"),
            onTap: () {
              NavigatorHelper.go2ColorAndThemeVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("异步UI更新"),
            onTap: () {
              NavigatorHelper.go2AsyncUIVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("对话框"),
            onTap: () {
              NavigatorHelper.go2DialogVC(context);
            },
          )
        ],
      ),
    );
  }
}
