import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class CheckBoxVC extends BaseStatefulWidget {
  @override
  _CheckBoxVCState createState() {
    // TODO: implement createState
    return _CheckBoxVCState();
  }
}

class _CheckBoxVCState extends BaseState<CheckBoxVC> {
  bool isCheckBoxChecked = false;
  bool isSwitchChecked = false;

  void toggleCheckBoxCheck(bool checked) {
    setState(() {
      isCheckBoxChecked = checked;
    });
  }

  void toggleSwitchCheck(bool checked) {
    setState(() {
      isSwitchChecked = checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("单选框和复选框"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Switch(value: isSwitchChecked, onChanged: toggleSwitchCheck),
              Checkbox(value: isCheckBoxChecked, onChanged: toggleCheckBoxCheck)
            ],
          ),
        ),
      ),
    );
  }
}
