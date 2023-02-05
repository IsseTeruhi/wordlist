import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:wordlistandtest_app/screens/home/home_screen_notifier.dart';
import '../models/notes/notes_model.dart';

final textProvider = StateProvider<String>((ref) => ''); ////
// bool型を使うためのProvider。初期値はfalseにする
final enableProvider = StateProvider<bool>(((ref) => true));
final noteProvider = StateProvider<Notes>(
    (ref) => Notes(text: "", addtime: DateTime.now(), id: "", qlist: []));

class Configuelist extends ConsumerWidget {
  Configuelist({Key? key}) : super(key: key); //widgetが固有のものを持つ
  final uuid = const Uuid();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(textProvider); ////
    

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
                ref.read(textProvider.notifier).state = data;
              },
            ),
            const SizedBox(height: 8),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // リスト追加ボタン
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(foregroundColor: Colors.amber),
                onPressed:text.isEmpty ////
                    ? null //directにnullをつけないと処理が反映されない
                    : () {
                        context.go('/newlist/add/:listid');
                        ref
                            .read(noteProvider.notifier)
                            .state
                            .copyWith(id: uuid.v4());
                        homeNotifier
                            .add(ref.watch(noteProvider.notifier).state);
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
