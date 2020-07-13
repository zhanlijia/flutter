import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';

class LocalizationsDelegateVC extends BaseStatefulWidget {
  @override
  _LocalizationsDelegateVCState createState() {
    // TODO: implement createState
    return _LocalizationsDelegateVCState();
  }
}

class _LocalizationsDelegateVCState extends BaseState<LocalizationsDelegateVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("LocalizationsDelegate"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(LocalizationsTest.of(context).text),
            RaisedButton(
              child: Text("change local"),
              onPressed: (){

              },
            )
          ],
        ),
      ),
    );
  }
}

class LocalizationsTest {
  bool isZH = false;

  LocalizationsTest(this.isZH);

  static LocalizationsTest of(BuildContext context) {
    return Localizations.of<LocalizationsTest>(context, LocalizationsTest);
  }

  String get text {
    return isZH ? "test应用" : "test app";
  }
}

class LocalizationsTestDelegate
    extends LocalizationsDelegate<LocalizationsTest> {
  LocalizationsTestDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    print("~~~ $locale");
    return ['en', 'zh', 'en_US'].contains(locale.languageCode);
  }

  @override
  Future<LocalizationsTest> load(Locale locale) {
    //Locale改变时都会再调用load方法重新加载新的local，无论shouldReload返回true还是false
    // TODO: implement load
    print('~~~ $locale');
    return SynchronousFuture<LocalizationsTest>(
        LocalizationsTest(locale.languageCode == 'zh'));
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationsTest> old) {
    // TODO: implement shouldReload
    return false; //只应该在local切换时加载一次，不需要每次在Localizations重新build事都加载
  }
}
