import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class BasicPageVC extends BaseStatelessWidget {

  var itemIcon = Icon(Icons.details);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: itemIcon,
            title: Text("啦啦渣渣"),
            onTap: () {
              NavigatorHelper.go2LalaZhaZha(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("基础组件"),
            onTap: () {
              NavigatorHelper.go2WidgetPage(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("布局类组件"),
            onTap: (){
              NavigatorHelper.go2LayoutPageVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("容器类组件"),
            onTap: (){
              NavigatorHelper.go2ContainerWidgetVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("可滚动组件"),
            onTap: (){
              NavigatorHelper.go2ScrollableWidget(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("功能性组件"),
            onTap: (){
              NavigatorHelper.go2FunctionWidgetVC(context);
            },
          )
        ],
      ),
    );
  }
}
