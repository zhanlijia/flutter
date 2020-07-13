import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/NavigatorHelper.dart';

class LocalizationsPageVC extends BaseStatefulWidget {
  @override
  _LocalizationsPageVCState createState() {
    // TODO: implement createState
    return _LocalizationsPageVCState();
  }
}

class _LocalizationsPageVCState extends BaseState<LocalizationsPageVC> {
  var itemIcon = Icon(Icons.beach_access);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("国际化"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: itemIcon,
            title: Text("LocalizationDelegate"),
            onTap: () {
              NavigatorHelper.go2LocalizationsDelegateVC(context);
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("Intl"),
            onTap: () {
              NavigatorHelper.go2IntlVC(context);
            },
          )
        ],
      ),
    );
  }
}
