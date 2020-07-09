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
  String radioSelectOption = "";

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

  void toggleRadioCheck(String option) {
    setState(() {
      radioSelectOption = option;
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
              Checkbox(
                  value: isCheckBoxChecked, onChanged: toggleCheckBoxCheck),
              Radio<String>(
                  value: "option1",
                  groupValue: radioSelectOption,
                  onChanged: toggleRadioCheck),
              Radio(
                  value: "option2",
                  groupValue: radioSelectOption,
                  onChanged: toggleRadioCheck)
            ],
          ),
        ),
      ),
    );
  }
}
