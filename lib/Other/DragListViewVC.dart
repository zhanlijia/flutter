import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class DragListViewVC extends BaseStatefulWidget {
  @override
  _DragListViewVCState createState() {
    // TODO: implement createState
    return _DragListViewVCState();
  }
}

class _DragListViewVCState extends BaseState<DragListViewVC> {
  var data = List(10).asMap().keys.map((e) => "item $e").toList();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("拖动排序"),
      ),
      body: ReorderableListView(
        children: data
            .map((e) => Dismissible(
                  key: ValueKey("dismiss_$e"),
                  child: SimpleDialogOption(
                    key: ValueKey(e),
                    child: Align(
                      widthFactor: 2,
                      heightFactor: 1,
                      child: Text(e),
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      data.removeAt(data.indexOf(e));
                    });
                  },
                ))
            .toList(),
        onReorder: (fromIndex, toIndex) {
          if (fromIndex < toIndex) {
            toIndex -= 1;
          }
          var temp = data.removeAt(fromIndex);
          data.insert(toIndex, temp);
          setState(() {});
        },
      ),
    );
  }
}
