import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class DemoPageVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var itemIcon = Icon(Icons.functions);
    return ListView(
      children: <Widget>[
        ListTile(
          leading: itemIcon,
          title: Text("拖动排序"),
          onTap: () {
            NavigatorHelper.go2DragListViewVC(context);
          },
        )
      ],
    );
  }
}
