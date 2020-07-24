import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class OthersPageVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var itemIcon = Icon(Icons.functions);
    return ListView(
      children: <Widget>[
        ListTile(
          leading: itemIcon,
          title: Text("拖动排序,滑动删除"),
          onTap: () {
            NavigatorHelper.go2SortAndDelListViewVC(context);
          },
        ),
        ListTile(
          leading: itemIcon,
          title: Text("Draggable"),
          onTap: () {
            NavigatorHelper.go2DraggableVC(context);
          },
        ),
        ListTile(
          leading: itemIcon,
          title: Text("DataPicker"),
          onTap: () {
            NavigatorHelper.go2DataPickerVC(context);
          },
        ),
        ListTile(
          leading: itemIcon,
          title: Text("WebView"),
          onTap: (){
            NavigatorHelper.go2WebViewVC(context);
          },
        )
      ],
    );
  }
}
