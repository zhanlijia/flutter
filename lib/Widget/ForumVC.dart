import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class ForumVC extends BaseStatefulWidget {
  @override
  _ForumVCState createState() {
    // TODO: implement createState
    return _ForumVCState();
  }
}

class _ForumVCState extends BaseState<ForumVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("表单"),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Form(
              autovalidate: true,
              child: Builder(builder: (context) {
                return Column(
                  children: <Widget>[
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "填写用户名",
                          prefixIcon: Icon(Icons.person)),
                      validator: (text) {
                        return text.trim().length != 0 ? null : "用户名不能为空";
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "填写密码",
                          prefixIcon: Icon(Icons.lock)),
                      validator: (text) {
                        return text.length >= 6 ? null : "密码长度不能小于6";
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                                child: Text("登录"),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  if (Form.of(context).validate()) {
                                    print("validate succ");
                                  }
                                }),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
            )));
  }
}
