import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class AsyncUIVC extends BaseStatefulWidget {
  @override
  _AsyncUIVCState createState() {
    // TODO: implement createState
    return _AsyncUIVCState();
  }
}

class Data {
  List<String> data;

  Data() {
    data = List<String>();
  }
}

class _AsyncUIVCState extends BaseState<AsyncUIVC> {
  //收发一次
  Future<Data> getData() async {//await同步
    var data = Data();
    await Future.delayed(Duration(seconds: 3), () {})
        .then((value) => data.data.add("step one data"));
    await Future.delayed(Duration(seconds: 3), () {})
        .then((value) => data.data.add("step two data"));
    data.data.add("step three data");
    return data;
  }

  //收发多次
  Stream<String> counter() {
    return Stream.fromFutures([//并发
      Future.delayed(Duration(seconds: 1), () {
        return "step one data";
      }),
      Future.delayed(Duration(seconds: 2), () {
        return "step two data";
      }),
      Future.delayed(Duration(seconds: 3), () {
        return "step three data";
      }),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("异步UI更新"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: counter(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("error ${snapshot.error}");
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("connectionState none");
                  case ConnectionState.waiting:
                    return Text("connectionState waiting");
                  case ConnectionState.active:
                    return Text("connectionState active ${snapshot.data}");
                  case ConnectionState.done:
                    return Text("connectionState done");
                }
                return null;
              },
            ),
            FutureBuilder<Data>(
                future: getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print("--- connectionState ${snapshot.connectionState}");
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text("get data error ${snapshot.error}");
                    } else {
                      Data data = snapshot.data;
                      print("${data.data.length}");
                      return Expanded(
                        child: ListView.builder(
                            itemCount: data.data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(data.data[index]),
                              );
                            }),
                      );
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
