import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/Widget/TapBox.dart';

import '../BaseWidget.dart';

class WidgetStateManager extends BaseStatefulWidget {
  @override
  _WidgetStateManagerState createState() {
    // TODO: implement createState
    return _WidgetStateManagerState();
  }
}

class _WidgetStateManagerState extends BaseState<WidgetStateManager> {
  bool statelessTapBoxState = false;
  bool multipleStateTapBoxState = false;

  void toggleStatelessTapBoxState(bool isActive) {
    setState(() {
      print("--- isActive $isActive" );
      statelessTapBoxState = isActive;
    });
  }

  void toggleMultipleStateTapBoxState(bool isActive){
    setState(() {
      multipleStateTapBoxState = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("--- statelessTapBoxState $statelessTapBoxState");
    print("--- multipleStateTapBoxState $multipleStateTapBoxState");
    return Scaffold(
      appBar: AppBar(
        title: Text("state manager"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TapBoxStateful(),
          TapBoxStateless(isActive: statelessTapBoxState,valueChanged: toggleStatelessTapBoxState,),
          TapBoxMultipleState(isActive: multipleStateTapBoxState,activeChange: toggleMultipleStateTapBoxState,)
        ],
      ),
    );
  }
}
