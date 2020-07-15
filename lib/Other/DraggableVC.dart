import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class DraggableVC extends BaseStatefulWidget {
  @override
  _DraggableVC createState() {
    // TODO: implement createState
    return _DraggableVC();
  }
}

class _DraggableVC extends BaseState<DraggableVC> {
  List<String> allData;
  List<String> pickUpData;
  List<String> remainData;
  List<String> leastData;

  double itemWidth = 0;
  double itemHeight = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allData = List.unmodifiable([
      "B",
      "C",
      "M",
      "PW",
      "PD",
      "注释",
      "存图",
      "存电影",
      "体标",
      "距离",
      "面积",
      "2B",
      "中位线",
      "穿刺引导线",
      "高级参数",
    ]);
    leastData = List.unmodifiable([
      "B",
      "高级参数",
      "注释",
    ]);

    setUpData(pickUpItems: leastData);
  }

  setUpData({List<String> pickUpItems}) {
    setUpPickUpData(pickUpItems);
    setUpRemainData();
  }

  setUpPickUpData(List<String> items) {
    pickUpData = [];
    items.forEach((element) {
      pickUpData.add(element);
    });
  }

  setUpRemainData() {
    remainData = [];
    print("--- ${pickUpData.toString()} ");
    allData.forEach((element) {
      if (!pickUpData.contains(element) && !leastData.contains(element)) {
        remainData.add(element);
      }
    });
    print("--- ${remainData.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final double menuWidth = 200;
    final double padding = 16;
    final gridViewWidth = (screenWidth - menuWidth - 2 * padding) / 2;

    itemWidth = gridViewWidth / 2 - 20;
    itemHeight = itemWidth * 0.3;

    return Scaffold(
        appBar: AppBar(
          title: Text("Draggable"),
        ),
        body: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              DragTarget<String>(
                builder: (context, acceptedList, rejectedList) {
                  return Container(
                    alignment: Alignment.centerRight,
                    width: gridViewWidth,
                    child: _generateGridView(pickUpData),
//                    child: _generateLiveView(pickUpData),
                  );
                },
                onAccept: (data) {
                  pickUpData.add(data);
                  setUpRemainData();
                  setState(() {});
                },
              ),
              Container(
                width: menuWidth,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
//                    RaisedButton(
//                      child: Text("<<"),
//                      onPressed: () {
//                        setUpData(pickUpItems: allData);
//                        setState(() {});
//                      },
//                    ),
                    RaisedButton(
                      child: Text(">>"),
                      onPressed: () {
                        setUpData(pickUpItems: leastData);
                        setState(() {});
                      },
                    ),
                    RaisedButton(
                      child: Text("Edit"),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              print("--- ${pickUpData.toString()}");
                              return Dialog(
                                child: UnconstrainedBox(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 100,
                                    height: screenHeight - 100,
                                    child: StatefulBuilder(
                                      builder: (context, innerSetState) {
                                        return Padding(
                                          padding: EdgeInsets.all(16),
                                          child: ReorderableListView(
                                            children: pickUpData
                                                .map((e) => Dismissible(
                                                      key: ValueKey(
                                                          "Dismissible $pickUpData $e"),
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: _getListItem(e),
                                                      ) ,
                                                      onDismissed: (_) {
                                                        pickUpData.remove(e);
                                                        setUpData(
                                                            pickUpItems:
                                                                pickUpData);
                                                        innerSetState(() {});
                                                        setState(() {});
                                                      },
                                                    ))
                                                .toList(),
                                            onReorder: (oldIndex, newIndex) {
                                              if (oldIndex < newIndex) {
                                                newIndex -= 1;
                                              }
                                              var value =
                                                  pickUpData.removeAt(oldIndex);
                                              pickUpData.insert(
                                                  newIndex, value);
                                              setUpData(
                                                  pickUpItems: pickUpData);
                                              innerSetState(() {});
                                              setState(() {});
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                    )
                  ],
                ),
              ),
              DragTarget<String>(
                builder: (context, acceptedList, rejectedList) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    width: gridViewWidth,
                    child: _generateGridView(remainData),
//                    child: _generateLiveView(remainData),
                  );
                },
                onAccept: (data) {
                  print("--- accept");
                  pickUpData.remove(data);
                  setUpRemainData();
                  setState(() {});
                },
              )
            ],
          ),
        ));
  }

  Widget _generateGridView(List<String> items) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: itemHeight,
            childAspectRatio: itemHeight / itemWidth,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Draggable<String>(
            feedback: _getListItem(items[index]),
            child: _getListItem(items[index]),
            onDragCompleted: () {
//              items.removeAt(index);
//              setState(() {});
            },
            data: items[index],
            childWhenDragging: Container(
              foregroundDecoration: BoxDecoration(color: Colors.white30),
              child: _getListItem(items[index]),
            ),
          );
        });
  }

  Widget _getListItem(String e) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Material(
        child: Container(
          width: 100,
          height: 50,
          color: Colors.blueAccent,
          alignment: Alignment.center,
          child: Text(
            e,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
