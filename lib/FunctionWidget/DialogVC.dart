import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/Util/DialogHelper.dart';

class DialogVC extends BaseStatefulWidget {
  @override
  _DialogVCState createState() {
    // TODO: implement createState
    return _DialogVCState();
  }
}

class _DialogVCState extends BaseState {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var itemIcon = Icon(Icons.add);
    List<String> dataSource =
        List(30).asMap().keys.map((e) => "item $e").toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("对话框"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: itemIcon,
            title: Text("AlertDialog"),
            onTap: () async {
              await DialogHelper.showAlertDialog<String>(
                  context: context,
                  content: "确定删除吗？",
                  actions: ["取消", "确定"],
                  actionBuilder: (e) {
                    return Text(e);
                  }).then((value) => print("alert dialog res value $value"));
              print("after alert dialog ");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("AlertDialogConvenience"),
            onTap: () async {
              await DialogHelper.showAlertDialogConvenience(
                context: context,
                content: "确定删除吗？",
              ).then((value) => print("alert dialog res value $value"));
              print("after alert dialog ");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("SimpleDialog"),
            onTap: () async {
              await DialogHelper.showSimpleDialog(
                  context: context,
                  title: "选择语言",
                  options: [
                    "中文",
                    "英文",
                  ],
                  optionBuilder: (e) {
                    return Text(e);
                  }).then((value) => print("simple dialog res value $value"));
              print("after simple dialog ");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("SimpleDialogConvenience"),
            onTap: () async {
              await DialogHelper.showSimpleDialogConvenience(
                  context: context,
                  title: "选择语言",
                  options: [
                    "中文",
                    "英文",
                  ]).then((value) => print("simple dialog res value $value"));
              print("after simple dialog ");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("Dialog"),
            onTap: () async {
              await DialogHelper.showListDlg(
                  context: context,
                  title: "请选择",
                  dataSource: dataSource,
                  itemBuilder: (e) {
                    return Text(e);
                  }).then((value) => print("dialog res value $value"));
              print("after dialog");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("DialogConvenience"),
            onTap: () async {
              await DialogHelper.showListDlgConvenience(
                      context: context, title: "请选择", dataSource: dataSource)
                  .then((value) => print("dialog res value $value"));
              print("after dialog");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("Material CustomDlg"),
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return UnconstrainedBox(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 280),
                        child: Material(
                          type: MaterialType.card,
                          child: Container(
                            color: Colors.redAccent,
                            height: 280,
                            width: double.infinity,
                            child: Text("custom dlg"),
                          ),
                        ),
                      ),
                    );
                  });
              print("after Material custom dialog");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("CustomDlg"),
            onTap: () async {
              await showCustomDlg<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("提示"),
                      content: Text("确定删除吗？"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("取消"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text("确定"),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        )
                      ],
                    );
                  }).then((value) => print("custom dlg res $value"));
              print("after custom dlg");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("对话框状态自管理+valueChange改withTree"),
            onTap: () async {
              await showDlgWithState1<bool>(context: context)
                  .then((value) => print("dlg with state1 res value $value"));
              print("after dlg with state1");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("获取真正的context"),
            onTap: () async {
              await showDlgWithState2<bool>(context: context)
                  .then((value) => print("dlg with state2 res value $value"));
              print("after dlg with state2");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("markNeedsBuild"),
            onTap: () async {
              await showDlgWithState3<bool>(context: context)
                  .then((value) => print("dlg with state3 res value $value"));
              print("after dlg with state3");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("底部菜单列表"),
            onTap: () async {
              await DialogHelper.showBottomSheetDlg<String>(
                      context: context,
                      dataSource: dataSource,
                      itemBuilder: (e, index) {
                        return Text(e);
                      })
                  .then((value) => print("bottom sheet dlg res value $value"));
              print("after bottom sheet dlg");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("底部菜单列表Convenience"),
            onTap: () async {
              await DialogHelper.showBottomSheetDlgConvenience(
                      context: context, dataSource: dataSource)
                  .then((value) => print("bottom sheet dlg res value $value"));
              print("after bottom sheet dlg");
            },
          ),
          Builder(
            builder: (context) {
              return ListTile(
                leading: itemIcon,
                title: Text("全屏底部菜单"),
                onTap: () async {
                  await DialogHelper.showBottomSheetFullScreen(
                          context: context,
                          dataSource: dataSource,
                          itemBuilder: (e, index) {
                            return Text(e);
                          })
                      .closed
                      .then((value) =>
                          print("全屏底部菜单 res value $value")); //拿不到返回值？？？
                  print("after 全屏底部菜单");
                },
              );
            },
          ),
          Builder(
            builder: (context) {
              return ListTile(
                leading: itemIcon,
                title: Text("全屏底部菜单Convenience"),
                onTap: () async {
                  await DialogHelper.showBottomSheetFullScreenConvenience(
                          context: context, dataSource: dataSource)
                      .closed
                      .then((value) =>
                          print("全屏底部菜单 res value $value")); //拿不到返回值？？？
                  print("after 全屏底部菜单");
                },
              );
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("Loading"),
            onTap: () {
              showLoadingDlg(context: context);
              Future.delayed(Duration(seconds: 2), () {
                Navigator.of(context).pop();
              });
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("DatePicker"),
            onTap: () async {
              var date = DateTime.now();
              await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: date,
                      lastDate: date.add(Duration(days: 30)))
                  .then((value) => print("date picker res value $value"));
              print("after date picker ");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("DatePicker iOS"),
            onTap: () async {
              var date = DateTime.now();
              await showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return Container(
                      color: Colors.white,
                      height: 200,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.dateAndTime,
                        minimumDate: date,
                        maximumDate: date.add(Duration(days: 30)),
                        maximumYear: date.year + 1,
                        onDateTimeChanged: (value) {
                          print(
                              "iOS date picker onDateTimeChanged callback $value");
                        },
                      ),
                    );
                  }).then((value) => print("iOS date picker future $value"));
              print("after iOS date picker");
            },
          ),
          ListTile(
            leading: itemIcon,
            title: Text("Time picker"),
            onTap: () async {
              var time = TimeOfDay.now();
              await showTimePicker(
                context: context,
                initialTime: time,
              ).then((value) => print("time picker res value $value"));
              print("after time picker ");
            },
          )
        ],
      ),
    );
  }

//  PersistentBottomSheetController _persistentBottomSheetController;

  //非Material自定义弹窗
  Future<T> showCustomDlg<T>(
      {@required BuildContext context,
      bool barrierDismissible = true,
      WidgetBuilder builder}) {
    final ThemeData _themeData = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          final Widget pageChild = Builder(
            builder: builder,
          );
          return SafeArea(
            child: Builder(builder: (context) {
              return _themeData != null
                  ? Theme(data: _themeData, child: pageChild)
                  : pageChild;
            }),
          );
        },
        barrierDismissible: barrierDismissible,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black87,
        transitionDuration: Duration(microseconds: 150),
        transitionBuilder: _buildMaterialDialogTransitions);
  }

  Widget _buildMaterialDialogTransitions(BuildContext context,
      Animation<double> animation, secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }

  bool withTree = false;

  //对话框状态自管理+valueChange改withTree
  Future<T> showDlgWithState1<T>({@required BuildContext context}) {
    return showDialog<T>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("确定删除?"),
                Row(
                  children: <Widget>[
                    Text("同时删除子文件夹？"),
                    DlgStateCB(
                      checked: withTree,
                      valueChanged: (v) {
                        withTree = !withTree;
                      },
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () {
                  Navigator.of(context).pop(withTree);
                },
              )
            ],
          );
        });
  }

  //获取真正的context
  Future<T> showDlgWithState2<T>({@required BuildContext context}) {
    return showDialog<T>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("确定删除?"),
                Row(
                  children: <Widget>[
                    Text("同时删除子文件夹？"),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return Checkbox(
                          value: withTree,
                          onChanged: (v) {
                            setState(() {
                              withTree = !withTree;
                            });
                          },
                        );
                      },
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () {
                  Navigator.of(context).pop(withTree);
                },
              )
            ],
          );
        });
  }

  //markNeedsBuild
  Future<T> showDlgWithState3<T>({@required BuildContext context}) {
    return showDialog<T>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("确定删除?"),
                Row(
                  children: <Widget>[
                    Text("同时删除子文件夹？"),
                    Builder(
                      builder: (context) {
                        return Checkbox(
                          value: withTree,
                          onChanged: (v) {
                            withTree = !withTree;
                            (context as Element).markNeedsBuild();
                          },
                        );
                      },
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () {
                  Navigator.of(context).pop(withTree);
                },
              )
            ],
          );
        });
  }

  Future showLoadingDlg({@required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return UnconstrainedBox(
            child: Container(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text("正在加载，请稍后。。。"),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class DlgStateCB extends BaseStatefulWidget {
  final bool checked;

  final ValueChanged<bool> valueChanged;

  DlgStateCB({this.checked, this.valueChanged});

  @override
  _DlgStateCBState createState() {
    // TODO: implement createState
    return _DlgStateCBState();
  }
}

class _DlgStateCBState extends BaseState<DlgStateCB> {
  bool state = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Checkbox(
        value: state,
        onChanged: (v) {
          widget.valueChanged(v);
          setState(() {
            state = v;
          });
        });
  }
}
