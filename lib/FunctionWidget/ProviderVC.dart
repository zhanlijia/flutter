import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

/// 代码太骚，半懂不懂😹
class ProviderVC extends BaseStatefulWidget {
  @override
  _ProviderVCState createState() {
    // TODO: implement createState
    return _ProviderVCState();
  }
}

class _ProviderVCState extends BaseState<ProviderVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("跨组件状态共享"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context) {
            return Column(
              children: <Widget>[
//                Builder(
//                  builder: (context) {
//                    var cart = ChangeNotifierProvider.of<CartModel>(context);
//                    return Text("总价：${cart.totalPrice}");
//                  },
//                )
                Consumer<CartModel>(builder: (context, cart) {
                  return Text("总价：${cart.totalPrice}");
                }),
                Builder(
                  builder: (context) {
                    print("RaisedButton build");
                    return RaisedButton(
                      child: Text('添加商品'),
                      onPressed: () {
                        ChangeNotifierProvider.of<CartModel>(
                            context, listen: false)
                            .add(Item(20, 1));
                      },
                    );
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

///
class Item {
  double price;
  int count;

  Item(this.price, this.count);
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  //禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items {
    return UnmodifiableListView(_items);
  }

  //购物车中商品总价
  double get totalPrice {
    return _items.fold(
        0,
            (previousValue, element) =>
        previousValue + element.count * element.price);
  }

  void add(Item item) {
    _items.add(item);

    notifyListeners();
  }
}

///一个通用的InheritedWidget，保存需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    // TODO: implement updateShouldNotify
    return true; //返回true，每次更新都会调用依赖他的子孙节点的'didChangeDependencies'???
  }
}

class ChangeNotifier implements Listenable {
  List listeners = [];

  @override
  void addListener(listener) {
    // TODO: implement addListener
    listeners.add(listener);
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
    listeners.remove(listener);
  }

  void notifyListeners() {
    listeners.forEach((element) {
      element();
    });
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier>
    extends BaseStatefulWidget {
  ChangeNotifierProvider({Key key, this.data, this.child});

  final Widget child;
  final T data;

  static T of<T>(BuildContext context, {bool listen = true}) {
//    final type = _typeOf<InheritedProvider<T>>();
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
        .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
        .widget as InheritedProvider<T>;
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() {
    // TODO: implement createState
    return _ChangeNotifierProviderState<T>();
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends BaseState<ChangeNotifierProvider<T>> {
  void update() {
    setState(() {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    //当Provider更新时，如果新旧数据不相等，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.data.addListener(update);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.data.removeListener(update);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}

class Consumer<T> extends BaseStatelessWidget {
  final Widget child;

  final Widget Function(BuildContext context, T value) builder;

  Consumer({Key key, @required this.builder, this.child})
      : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return builder(context, ChangeNotifierProvider.of<T>(context));
  }
}
