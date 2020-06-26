import 'package:flutter/material.dart';

class DialogHelper {
  static Future<T> showAlertDialog<T>(
      {@required BuildContext context,
      String title = "提示",
      @required String content,
      @required List<T> actions,
      @required Widget Function(T) actionBuilder}) {
    return showDialog<T>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: Text(content),
            ),
            actions: actions
                .map((e) => FlatButton(
                      child: actionBuilder(e),
                      onPressed: () {
                        Navigator.of(context).pop(e);
                      },
                    ))
                .toList(),
          );
        });
  }

  ///[showAlertDialog] convenience
  static Future<String> showAlertDialogConvenience({
    @required BuildContext context,
    String title = "提示",
    @required String content,
    List<String> actions = const ["取消", "确定"],
  }) {
    return showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: Text(content),
            ),
            actions: actions
                .map((e) => FlatButton(
                      child: Text(e),
                      onPressed: () {
                        Navigator.of(context).pop(e);
                      },
                    ))
                .toList(),
          );
        });
  }

  static Future<T> showSimpleDialog<T>(
      {@required BuildContext context,
      @required String title,
      @required List<T> options,
      @required Widget Function(T) optionBuilder}) {
    return showDialog<T>(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(title),
            children: options
                .map((e) => SimpleDialogOption(
                      onPressed: () {
                        Navigator.of(context).pop(e);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: optionBuilder(e),
                      ),
                    ))
                .toList(),
          );
        });
  }

  ///[showSimpleDialog] convenience
  static Future<String> showSimpleDialogConvenience(
      {@required BuildContext context,
      @required String title,
      @required List<String> options}) {
    return showDialog<String>(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(title),
            children: options
                .map((e) => SimpleDialogOption(
                      onPressed: () {
                        Navigator.of(context).pop(e);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Text(e),
                      ),
                    ))
                .toList(),
          );
        });
  }

  static Future<T> showListDlg<T>(
      {@required BuildContext context,
      @required String title,
      @required List<T> dataSource,
      @required Widget Function(T) itemBuilder}) {
    return showDialog<T>(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(title),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var item = dataSource[index];
                      return ListTile(
                        title: itemBuilder(item),
                        onTap: () {
                          Navigator.of(context).pop(item);
                        },
                      );
                    },
                    itemCount: dataSource.length,
                  ),
                )
              ],
            ),
          );
        });
  }

  ///[showListDlg] convenience
  static Future<String> showListDlgConvenience({
    @required BuildContext context,
    @required String title,
    @required List<String> dataSource,
  }) {
    return showDialog<String>(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(title),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var item = dataSource[index];
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          Navigator.of(context).pop(item);
                        },
                      );
                    },
                    itemCount: dataSource.length,
                  ),
                )
              ],
            ),
          );
        });
  }

  //底部菜单列表
  static Future<T> showBottomSheetDlg<T>(
      {@required BuildContext context,
      @required List<T> dataSource,
      @required Widget Function(T, int) itemBuilder}) {
    return showModalBottomSheet<T>(
        context: context,
        builder: (context) {
          return ListView.builder(
              itemCount: dataSource.length,
              itemBuilder: (context, index) {
                var item = dataSource[index];
                return ListTile(
                  title: itemBuilder(item, index),
                  onTap: () {
                    Navigator.of(context).pop(item);
                  },
                );
              });
        });
  }

  ///[showBottomSheetDlg] convenience
  static Future<String> showBottomSheetDlgConvenience({
    @required BuildContext context,
    @required List<String> dataSource,
  }) {
    return showModalBottomSheet<String>(
        context: context,
        builder: (context) {
          return ListView.builder(
              itemCount: dataSource.length,
              itemBuilder: (context, index) {
                var item = dataSource[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    Navigator.of(context).pop(item);
                  },
                );
              });
        });
  }

  static PersistentBottomSheetController<T> showBottomSheetFullScreen<T>(
      {@required BuildContext context,
      @required List<T> dataSource,
      @required Widget Function(T, int) itemBuilder}) {
    return showBottomSheet<T>(
        context: context,
        builder: (context) {
          return ListView.builder(
              itemCount: dataSource.length,
              itemBuilder: (context, index) {
                var item = dataSource[index];
                return ListTile(
                  title: itemBuilder(item, index),
                  onTap: () {
                    Navigator.of(context).pop(item);
                  },
                );
              });
        });
  }

  ///[showBottomSheetFullScreen] convenience
  static PersistentBottomSheetController<String>
      showBottomSheetFullScreenConvenience({
    @required BuildContext context,
    @required List<String> dataSource,
  }) {
    return showBottomSheet<String>(
        context: context,
        builder: (context) {
          return ListView.builder(
              itemCount: dataSource.length,
              itemBuilder: (context, index) {
                var item = dataSource[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    Navigator.of(context).pop(item);
                  },
                );
              });
        });
  }

}
