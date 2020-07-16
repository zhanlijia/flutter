import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Widget/Button.dart';

class DataPickerVC extends BaseStatefulWidget {
  @override
  _DataPickerVCState createState() {
    // TODO: implement createState
    return _DataPickerVCState();
  }
}

class ProbeEntity {
  String name;
  IconData icon;
  int id;

  ProbeEntity({this.name, this.icon, this.id});
}

class ProbeApp {
  String name;
  IconData icon;
  void Function() actionClick;

  ProbeApp({this.name, this.icon, this.actionClick});
}

enum ProbeConnectState {
  none,
  probeConnecting,
  probeConnectSuccess,
  probeConnectFail
}

class _DataPickerVCState extends BaseState<DataPickerVC> {
  List<ProbeEntity> probeList;

  Timer timer;

  List<ProbeApp> appList = [];

  ProbeConnectState _probeConnectState = ProbeConnectState.none;

  bool _remember = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    probeList = [
      ProbeEntity(name: "线阵A", icon: Icons.linear_scale, id: 1),
      ProbeEntity(name: "凸阵A", icon: Icons.linear_scale, id: 2),
      ProbeEntity(name: "线阵B", icon: Icons.linear_scale, id: 3),
      ProbeEntity(name: "凸阵B", icon: Icons.linear_scale, id: 4)
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("DataPicker"),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
//              width: double.infinity,
              color: Colors.greenAccent,
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      magnification: 1.5,
                      itemExtent: 50,
                      children: probeList.map((e) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.mobile_screen_share),
                            Text(e.name)
                          ],
                        );
                      }).toList(),
                      onSelectedItemChanged: (index) {
                        print("--- value change");
                        timer?.cancel();
                        timer = Timer(Duration(seconds: 1), () {
                          connectProbe();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: _builder4Content(context),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Checkbox(
                        value: _remember,
                        onChanged: (selected) {
                          setState(() {
                            _remember = selected;
                          });
                        },
                      ),
                      Text("remember")
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _builder4Content(BuildContext context) {
    switch (_probeConnectState) {
      case ProbeConnectState.none:
        return Center();
      case ProbeConnectState.probeConnecting:
        return Center(
          child: CircularProgressIndicator(),
        );
      case ProbeConnectState.probeConnectFail:
        return Center(
          child: Text("probe connect failed"),
        );
      case ProbeConnectState.probeConnectSuccess:
        return Center(
          child: GridView.builder(
              itemCount: appList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                var item = appList[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Icon(item.icon), Text(item.name)],
                );
              }),
        );
      default:
        return null;
    }
  }

  connectProbe() {
    print("--- connect probe");
    setState(() {
      _probeConnectState = ProbeConnectState.probeConnecting;
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
//          _probeConnectState = ProbeConnectState.probeConnectFail;
          appList = [
            ProbeApp(name: "app1", icon: Icons.timer),
            ProbeApp(name: "app2", icon: Icons.timer),
            ProbeApp(name: "app3", icon: Icons.timer),
            ProbeApp(name: "app4", icon: Icons.timer),
            ProbeApp(name: "app5", icon: Icons.timer),
          ];
          _probeConnectState = ProbeConnectState.probeConnectSuccess;
        });
      });
    });
  }
}
