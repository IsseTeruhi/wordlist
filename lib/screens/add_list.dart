import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:wordlistandtest_app/screens/home/home_screen_notifier.dart';
import '../models/notes/notes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//final textProvider = StateProvider<String>((ref) => ''); ////
// bool型を使うためのProvider。初期値はfalseにする
final enableProvider = StateProvider<bool>(((ref) => true));
final currentNoteProvider = StateProvider<Notes>(
    (ref) => Notes(text: "", addtime: DateTime.now(), id: "", qlist: []));

class Addlist extends ConsumerWidget {
  Addlist({Key? key})
      : super(key: key); //widgetが固有のものを持つ
  final uuid = const Uuid();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    final note = ref.watch(currentNoteProvider);

    final boolNotifier = ref.read(enableProvider.notifier); ////

    final homeNotifier =
        ref.read(homeScreenProvider.notifier); //動的な変更処理、関数処理を行うときにnotifierを使う
    return Scaffold(
      // *** 追加する部分 ***
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      // *** 追加する部分 ***
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // テキスト入力
            TextFormField(
              //controller: ref.read(textProvider.notifier).state,
              onChanged: (String data) {
                final _edditedtextnote = note.copyWith(text: data);
                ref.read(currentNoteProvider.notifier).state = _edditedtextnote;
              },
            ),
            const SizedBox(height: 8),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // リスト追加ボタン
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(foregroundColor: Colors.amber),
                onPressed: note.text.isEmpty ////
                    ? null //directにnullをつけないと処理が反映されない
                    : () {
                       
                        final _tentatibeid = uuid.v4();
                        final _editididnote = note.copyWith(id: _tentatibeid);
                        homeNotifier.addnote(_editididnote);
                         context.go('/add/$_tentatibeid/0');
                        //ref.read(noteProvider.notifier).state=Notes(text: "", addtime: DateTime.now(), id: "", qlist: []);
                      },
                // ①
                //  () => _submit(),
                // ②
                //  (){
                //   _submit();
                // ③
                //  },
                //  _submit,
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // キャンセルボタン
              child: TextButton(
                // ボタンをクリックした時の処理
                onPressed: () => context.go('/'),
                child: Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
