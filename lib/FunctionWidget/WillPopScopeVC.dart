import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class WillPopScopeVC extends BaseStatefulWidget {
  @override
  _WillPopScopeVCState createState() {
    // TODO: implement createState
    return _WillPopScopeVCState();
  }
}

class _WillPopScopeVCState extends BaseState<WillPopScopeVC> {
  DateTime lastClickTime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        if (lastClickTime == null ||
            lastClickTime.difference(DateTime.now()).abs() >
                Duration(seconds: 1)) {
          //difference有正负，所有比对不能倒
          lastClickTime = DateTime.now();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("导航返回拦截"),
        ),
      ),
    );
  }
}
