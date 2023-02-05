import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordlistandtest_app/models/questions/questions_model.dart';

import 'home/home_screen_notifier.dart';

final textProvider = StateProvider.autoDispose((ref) {
  ////
  // riverpodで使うには、('')が必要////
  return TextEditingController(text: ''); ////
}); ////
// bool型を使うためのProvider。初期値はfalseにする
final enableProvider = StateProvider.autoDispose((ref) => true); ////


class Addlist extends ConsumerWidget {
  Addlist({Key? key}): super(key: key);
  Questions _newquestion = Questions(state:"", image :"",option: [],answer: "",explain: "",noteid: "");  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerProvider = ref.watch(textProvider.state); ////
    // bool型のProviderを呼び出す!
    final boolProvider = ref.watch(enableProvider.state); ////

    final homeNotifier =
        ref.read(homeScreenProvider.notifier); //動的な変更処理、関数処理を行うときにnotifierを使う
     return Scaffold(
      appBar: AppBar(
        title: Text('問題追加'),),
       body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 70,
              child: Center(
                child: Text(
                  'Q1',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(30),
                fillColor: Colors.red,
                filled: true,
                border: OutlineInputBorder(),
                hintText: '問題文を入力してください',
              ),
              onChanged: (String data) {
                if (controllerProvider.state.text.isNotEmpty) {
                  ////
                  boolProvider.state = true; ////
                } else {
                  ////
                  boolProvider.state = false; ////
                  _newquestion = _newquestion.copyWith(state: data); ////
                } ////
              },
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                      child: ElevatedButton(
                        child: Text('agreeable'),
                        onPressed: null,
                      )
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        child: Text('agree'),
                        onPressed: null,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        child: Text('agreement'),
                        onPressed: null,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        child: Text('agreeably'),
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


