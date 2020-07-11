import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:testflutter/BaseWidget.dart';

class HttpDioVC extends BaseStatefulWidget {
  @override
  _HttpDioVCState createState() {
    // TODO: implement createState
    return _HttpDioVCState();
  }
}

class _HttpDioVCState extends BaseState<HttpDioVC> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpDio"),
      ),
      body: Center(
        child: FutureBuilder(
          future: dio.get("https://api.github.com/orgs/flutterchina/repos"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              Response response = snapshot.data;
              var res = response.data;
              return ListView.builder(
                itemCount: res.length,
                itemBuilder: (content, index) {
                  var item = res[index]["full_name"];
                  return SimpleDialogOption(
                    child: Text(item),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
