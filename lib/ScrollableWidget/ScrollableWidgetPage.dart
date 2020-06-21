import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class ScrollableWidgetPage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemIcon = Icon(Icons.access_alarms);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("可滚动组件"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: itemIcon,
            title: Text("SingleChildScrollerView"),
            onTap: () {
              NavigatorHelper.go2SingleChildScrollerView(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("ListView"),
            onTap: () {
              NavigatorHelper.go2ListViewVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("GridView"),
            onTap: () {
              NavigatorHelper.go2GridViewVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("CustomScrollerView"),
            onTap: () {
              NavigatorHelper.go2CustomScrollerViewVC(context);
            },
          )
        ],
      ),
    );
  }
}
