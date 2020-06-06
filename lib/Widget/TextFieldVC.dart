import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class TextFieldVC extends BaseStatefulWidget {
  @override
  _TextFieldVCState createState() {
    // TODO: implement createState
    return _TextFieldVCState();
  }
}

class _TextFieldVCState extends BaseState<TextFieldVC> {
  //onchange监听文本变化
  String userName;

  void saveUserName(String name) {
    userName = name;
    print(userName);
  }

  //TextEditingController监听文本变化，记得dispose释放资源
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _selectedController = TextEditingController();

  //
  FocusNode nameNode = new FocusNode();
  FocusNode pwsNode = FocusNode();
  FocusNode customBorder = FocusNode();
  FocusScopeNode scopeNode;

  //
  bool customBorderTVFocus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //TextEditingController
    _controller.addListener(() {
      print(_controller.text);
    });

    _selectedController.text = "selected Controller text";
    _selectedController.selection = TextSelection(
        baseOffset: 2, extentOffset: _selectedController.text.length);
    _selectedController.addListener(() {
      _selectedController.selection = TextSelection(
          baseOffset: 2, extentOffset: _selectedController.text.length);
    });

    //FocusNode
    nameNode.addListener(() {
      print("nameNode hasFocus:${nameNode.hasFocus}");
    });

    customBorder.addListener(() {
      setState(() {
        customBorderTVFocus = !customBorderTVFocus;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _selectedController.dispose();
    nameNode.dispose();
    pwsNode.dispose();
    customBorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//  return Theme(
//
//  );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: nameNode,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名/邮箱",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellowAccent))),
                onChanged: saveUserName, //onChanged记录文本变化
//              controller:  _controller,
              ),
              TextField(
                controller: _controller,
                focusNode: pwsNode,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blueAccent,
                    )),
                obscureText: true,
              ),
              TextField(
                controller: _selectedController,
              ),
//              RaisedButton(
//                child: Text("移动焦点"),
//                onPressed: () {
//                  if(null == scopeNode){
//                    scopeNode = FocusScope.of(context);
//                  }
//                  scopeNode.requestFocus(pwsNode);
//                },
//              ),
//              RaisedButton(
//                child: Text("隐藏键盘"),
//                onPressed: () {
//                  nameNode.unfocus();
//                  pwsNode.unfocus();
//                },
//              ),
              Theme(
                  data: Theme.of(context).copyWith(
                      hintColor: Colors.grey[200],
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle:
                              TextStyle(color: Colors.pink, fontSize: 14))),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: "用户名",
                            hintText: "用户名或邮箱",
                            prefixIcon: Icon(Icons.person)),
                      ),
                      Container(
                        child: TextField(
                          focusNode: customBorder,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              labelText: "密码",
                              hintText: "您的登录密码",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                              border: InputBorder.none),
                          obscureText: true,
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: customBorderTVFocus ? Colors.red : Colors.grey, width: 5))),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
