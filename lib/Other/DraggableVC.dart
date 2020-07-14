import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class DraggableVC extends BaseStatefulWidget {
  @override
  _DraggableVC createState() {
    // TODO: implement createState
    return _DraggableVC();
  }
}

class _DraggableVC extends BaseState<DraggableVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable"),
      ),
      body: Center(),
    );
  }
}
