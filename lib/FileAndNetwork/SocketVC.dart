import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class SocketVC extends BaseStatefulWidget {
  @override
  _SocketVCState createState() {
    // TODO: implement createState
    return _SocketVCState();
  }
}

class _SocketVCState extends BaseState<SocketVC> {
  var text = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Request "),
              onPressed: () async {
                var socket = await Socket.connect("baidu.com", 80);
                socket.writeln("GET / HTTP/1.1");
                socket.writeln("Host:baidu.com");
                socket.writeln("Connection:close");
                socket.writeln();
                await socket.flush();
                socket.close().then((value) {
                  value
                      .cast<List<int>>()
                      .transform(utf8.decoder)
                      .listen((content) {
                    setState(() {
                      text = content;
                    });
                  });
                });
              },
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
