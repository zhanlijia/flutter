import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class FileVC extends BaseStatefulWidget{
  @override
  _FileVCState createState() {
    // TODO: implement createState
    return _FileVCState();
  }

}

class _FileVCState extends BaseState<FileVC>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("文件操作"),),
    );
  }

}
