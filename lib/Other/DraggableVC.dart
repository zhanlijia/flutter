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

class ParaEntity {
  String name;
  bool canEdit;

  void Function() actionClick;

  ParaEntity({this.name, this.canEdit = true, this.actionClick});

  @override
  String toString() {
    return 'ParaEntity{name: $name, canEdit: $canEdit, actionClick: $actionClick}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParaEntity &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

class _DraggableVC extends BaseState<DraggableVC> {
  List<ParaEntity> allData;
  List<ParaEntity> pickUpData;
  List<ParaEntity> remainData;
  List<ParaEntity> leastData;

  double itemWidth = 0;
  double itemHeight = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allData = List.unmodifiable([
      ParaEntity(name: "B", canEdit: false),
      ParaEntity(name: "C"),
      ParaEntity(name: "M"),
      ParaEntity(name: "PW"),
      ParaEntity(name: "PD"),
      ParaEntity(name: "注释"),
      ParaEntity(name: "存图"),
      ParaEntity(name: "存电影"),
      ParaEntity(name: "体标"),
      ParaEntity(name: "距离"),
      ParaEntity(name: "面积"),
      ParaEntity(name: "2B"),
      ParaEntity(name: "中位线"),
      ParaEntity(name: "穿刺引导线"),
      ParaEntity(name: "高级参数", canEdit: false),
    ]);
    leastData = List.unmodifiable([
      ParaEntity(name: "B", canEdit: false),
      ParaEntity(name: "高级参数", canEdit: false),
      ParaEntity(name: "注释", canEdit: false),
    ]);

    setUpData(pickUpItems: leastData);
  }

  setUpData({List<ParaEntity> pickUpItems}) {
    setUpPickUpData(pickUpItems);
    setUpRemainData();
  }

  setUpPickUpData(List<ParaEntity> items) {
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
              DragTarget<ParaEntity>(
                builder: (context, acceptedList, rejectedList) {
                  return Container(
                    alignment: Alignment.centerRight,
                    width: gridViewWidth,
                    child: _generateGridView(pickUpData),
//                    child: _generateLiveView(pickUpData),
                  );
                },
                onAccept: (data) {
                  if (!pickUpData.contains(data)) {
                    pickUpData.add(data);
                  }
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
                                    width: 400,
                                    height: screenHeight - 100,
                                    child: StatefulBuilder(
                                      builder: (context, innerSetState) {
                                        return Container(
                                          padding: EdgeInsets.all(16),
                                          child: ReorderableListView(
                                            children: pickUpData.map((e) {
                                              var key = ValueKey(
                                                  "Dismissible $pickUpData $e");
                                              return e.canEdit
                                                  ? Dismissible(
                                                      key: key,
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: _getListItem(
                                                            entity: e),
                                                      ),
                                                      onDismissed: (_) {
                                                        pickUpData.remove(e);
                                                        setUpData(
                                                            pickUpItems:
                                                                pickUpData);
                                                        innerSetState(() {});
                                                        setState(() {});
                                                      },
                                                    )
                                                  : Container(
                                                      width: double.infinity,
                                                      key: key,
                                                      child: _getListItem(
                                                        entity: e,
                                                      ),
                                                    );
                                            }).toList(),
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
              DragTarget<ParaEntity>(
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

  Widget _generateGridView(List<ParaEntity> items) {
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
          var entity = items[index];

          return entity.canEdit
              ? Draggable<ParaEntity>(
                  feedback: _getListItem(entity: entity),
                  child: _getListItem(entity: entity),
                  onDragCompleted: () {
//              items.removeAt(index);
//              setState(() {});
                  },
                  data: entity,
                  childWhenDragging: Container(
                    foregroundDecoration: BoxDecoration(color: Colors.white30),
                    child: _getListItem(entity: entity),
                  ),
                )
              : _getListItem(entity: entity);
        });
  }

  Widget _getListItem({Key key, ParaEntity entity}) {
    return Padding(
      key: key,
      padding: EdgeInsets.only(bottom: 10),
      child: Material(
        child: Container(
          width: 100,
          height: 50,
          color: Colors.blueAccent,
          alignment: Alignment.center,
          child: Text(
            entity.name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
