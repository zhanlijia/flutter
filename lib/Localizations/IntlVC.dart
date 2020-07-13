import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testflutter/BaseWidget.dart';
import 'package:testflutter/l10n/IntlHelper.dart';

class IntlVC extends BaseStatefulWidget {
  @override
  _IntlVCState createState() {
    // TODO: implement createState
    return _IntlVCState();
  }
}

class _IntlVCState extends BaseState<IntlVC> {
  var _local = Locale("zh", "CN");
  var isZH = false;

  changeLocal() {
    setState(() {
      _local = isZH ? Locale("zh", "CN") : Locale("en", "US");
      isZH = !isZH;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Intl"),
      ),
      body: Localizations.override(
        context: context,
        locale: _local,
        child: Center(
          child: Column(
            children: <Widget>[
              Text("${IntlLocalizations.of(context).title}"),
              RaisedButton(
                child: Text("change local"),
                onPressed: () {
                  changeLocal();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
