import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class FileAndNetworkPageVC extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemIcon = Icon(Icons.forward);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作与网络请求"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: itemIcon,
            title: Text("文件操作"),
            onTap: () {
              NavigatorHelper.go2FileVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("HttpClient"),
            onTap: () {
              NavigatorHelper.go2HttpClientVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("HttpDio"),
            onTap: () {
              NavigatorHelper.go2HttpDioVC(context);
            },
          )
        ],
      ),
    );
  }
}
