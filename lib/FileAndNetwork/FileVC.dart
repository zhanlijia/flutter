import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testflutter/BaseWidget.dart';

class FileVC extends BaseStatefulWidget {
  @override
  _FileVCState createState() {
    // TODO: implement createState
    return _FileVCState();
  }
}

class _FileVCState extends BaseState<FileVC> {
  int count = 0;

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    var tempDir = Directory("$dir/temp");
    await tempDir.exists().then((value) {
      if (!value) {
        tempDir.create();
      }
    });
    return File("${tempDir.path}/count.txt");
  }

  Future<int> readCount() async {
    try {
      File file = await _getLocalFile();
      String res = await file.readAsString();
      return int.parse(res);
    } catch (e, s) {
      print("$e");
      print("$s");
      return 0;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readCount().then((value) {
      setState(() {
        count = value;
      });
    });
  }

  Future incrementCount() async {
    setState(() {
      count++;
    });
    await (await _getLocalFile()).writeAsString("$count");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$count"),
            RaisedButton(
              onPressed: () {
                incrementCount();
              },
              child: Text('increase'),
            )
          ],
        ),
      ),
    );
  }
}
