import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/FileAndNetwork/User.dart';
import 'package:testflutter/models/Another.dart';

class JsonAndModelVC extends BaseStatefulWidget {
  @override
  _JsonAndModelVCState createState() {
    // TODO: implement createState
    return _JsonAndModelVCState();
  }
}

class _JsonAndModelVCState extends BaseState<JsonAndModelVC> {
  User user = User("a", "a");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Another entity = Another();
    entity.name = "aaa";
    entity.age = 10;
    entity.loved = 3;

    String jsonString = jsonEncode(entity);
    print("--- jsonString $jsonString");
    Another another = jsonDecode(jsonString);
    print("--- another ${another.toString()}");

    return Scaffold(
      appBar: AppBar(
        title: Text("Json Model"),
      ),
    );
  }
}
