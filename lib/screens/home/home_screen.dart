import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../models/notes/notes_model.dart';
import 'home_screen_notifier.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeScreenProvider); //river podでデータの更新の監視
    List _notelist = state.notelist;
    List<String> _selecter = ["編集", "削除", "キャンセル"];
    _alert(_id, _uindex) {
      //context意味？
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "警告",
              style: TextStyle(color: Colors.red),
            ),
            content: Text("本当に削除しますか？"),
            actions: <Widget>[
              // ボタン領域
              TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  //context.go('/');
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  print(_notelist);
                  //_notelist.removeAt(_uindex);  //listの削除処理がわからない(riverpodを使った？,ref.read ?)
                  //context.go('/');           //routerが使えない？
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      body: ListView.builder(
        itemCount: _notelist.length,
        //表示するlistの長さを制限,.lengthで長さ取得
        itemBuilder: (context, index) {
          return Dismissible(
            direction: DismissDirection.endToStart, //削除機能の方向
            //Dismissibleはリストのスライド削除機能、ラップして使える
            key: UniqueKey(),
            child: Container(
              padding: EdgeInsets.all(15.0), //長方形の4辺全てに同じ値の余白
              decoration: new BoxDecoration(
                  border: new Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              child: ListTile(
                onTap: () => context.go('/Q/:listid'),
                title: Text(
                  _notelist[index].text,
                  style: TextStyle(fontSize: 30),
                ),
                subtitle: Text(
                  _notelist[index].addtime.toString(),
                  style: TextStyle(fontSize: 15),
                ),
                trailing: PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  onSelected: (String s) {
                    if (s == '編集') {
                      context.go('/listedit/:listid');
                    }
                    if (s == '削除') {
                      _alert(_notelist[index].id, index);
                    }
                    if (s == 'キャンセル') {
                      context.go('/');
                    }
                    ;
                  },
                  itemBuilder: (BuildContext context) {
                    return _selecter.map((String s) {
                      return PopupMenuItem(
                        child: Text(
                          s,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'font_1_honokamarugo_1.1',
                            color: s == '削除' ? Colors.red : Colors.black,
                          ),
                        ),
                        value: s,
                      );
                    }).toList();
                  },
                ),
              ),
            ),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/newlist/configue'),
        child: Icon(Icons.add),
      ),
    );
  }
}
