//状態管理のファイル
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordlistandtest_app/models/reports/reports_model.dart';

import '../../models/questions/questions_model.dart';

part 'result_screen_notifier.freezed.dart';

//状態 ( state ) を保持することを責務とする。
////Immutable な CounterState を宣言
////NullSafety 対応のため デフォルト値を宣言
@freezed
class ResultScreenState with _$ResultScreenState {
  const factory ResultScreenState(
      {required List<Reports> reportList,
      required List<Questions> quizList //状態管理したいものを入れる
      }) = _ResultScreenState;
}

//
final resultScreenProvider =
    StateNotifierProvider<ResultScreenNotifier, ResultScreenState>(
  (ref) => ResultScreenNotifier(ref)..initState(),
);

class ResultScreenNotifier extends StateNotifier<ResultScreenState> {
  final Ref ref;
  //ログイン・ログアウトするたびに状態をアップデート

  ResultScreenNotifier(this.ref)
      : super(ResultScreenState(reportList: [], quizList: [])) {
    //ここに初期処理を書く
    initState();
    //例　ローカルのデータベースの初期処理
  }
  //状態処理のプログラムをここでまとめている

  Future<void> initState() async {
    //WidgetsBinding.instance.addPostFrameCallback((_) => ref.read(noteProvider.notifier).state=Notes(text: "", addtime: DateTime.now(), id: "", qlist: []));
    //build完了時　=>以降の処理(ref.read....)
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> localsave() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Reports> savenote = state.reportList;
    List<String> data = savenote.map((e) => jsonEncode(e)).toList();
    prefs.setStringList('lreportList', data);
  }

  Future<void> localroad(String noteId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final reportData = prefs.getStringList('lreportList');
    if (reportData != null) {
      List<Reports> loadnote =
          reportData.map((e) => Reports.fromJson(jsonDecode(e))).toList();

      state = state.copyWith(reportList: loadnote);
    }
    final quizData = prefs.getStringList('quizList');
    if (quizData != null) {
      List<Questions> allQuestions =
          quizData.map((e) => Questions.fromJson(jsonDecode(e))).toList();
      state = state.copyWith(
          quizList: allQuestions
              .where((element) => element.noteid == noteId)
              .toList());
    }
    // state は immutable なため、copyWith で複製する
  }
}
