import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomWord extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final word = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        child: Column(
          children: <Widget>[
            Text(word.toString()),
            Builder(builder: (context){
              CupertinoPageScaffold scaffold = context.findAncestorWidgetOfExactType<CupertinoPageScaffold>();
              return (scaffold.navigationBar as CupertinoNavigationBar).middle;
            })
          ],
        ),
      ),
    );
  }

}