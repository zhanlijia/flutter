import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketVC extends BaseStatefulWidget {
  @override
  _WebSocketVCState createState() {
    // TODO: implement createState
    return _WebSocketVCState();
  }

}

class _WebSocketVCState extends BaseState<WebSocketVC> {

  TextEditingController _controller;
  IOWebSocketChannel channel;
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    channel = IOWebSocketChannel.connect("ws://echo.websocket.org");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("WebSocket"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: 'send a message'
              ),
            )),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  text = "网络不通。。。";
                } else if (snapshot.hasData) {
                  text = "echo : ${snapshot.data}";
                }
                print("--- $text");
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(text),
                );
              },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.text.isNotEmpty) {
            channel.sink.add(_controller.text);
          }
        },
        tooltip: "send message",
        child: Icon(Icons.send),
      ),
    );
  }

}