import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordlistandtest_app/common/constants.dart';
import 'package:wordlistandtest_app/models/reports/reports_model.dart';
import 'package:uuid/uuid.dart';

part 'quiz_screen_notifier.freezed.dart';

@freezed

@freezed
class QuizScreenState with _$QuizScreenState {
  const factory QuizScreenState({
    required List<Reports> reportList, //状態管理したいものを入れる
  }) = _QuizScreenState;
}

final quizScreenProvider =
    StateNotifierProvider<QuizScreenNotifier, QuizScreenState>(
  (ref) => QuizScreenNotifier(ref)..initState(),
);
class QuizScreenNotifier extends StateNotifier<QuizScreenState> {
  final Ref ref;
  
  QuizScreenNotifier(this.ref) : super(QuizScreenState(reportList: [])) {
    //ここに初期処理を書く
    initState();
    //例　ローカルのデータベースの初期処理
  }
   //状態処理のプログラムをここでまとめている

  Future<void> initState() async {
    
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

  Future<void> localroad() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('lreportList');
    if (data != null) {
      List<Reports> loadnote =
          data.map((e) => Reports.fromJson(jsonDecode(e))).toList();
      state = state.copyWith(reportList: loadnote);
    }
  }

  void addReport(String noteid,String questionid,String selected,bool iscorrect) {
     final uuid = const Uuid();
     final _uuid = uuid.v4();
    Reports report = Reports(
        id:_uuid,
        noteid: noteid,
        questionid: questionid,
        selected: selected,
        iscorrect: iscorrect,
        timestamp: DateTime.now(),
        );
    List<Reports> newReports = [...state.reportList, report];
    state = state.copyWith(reportList: newReports);
    localsave();
  }

  // state は immutable なため、copyWith で複製する
  void updateQuestion(Reports question,int index) {

removeTodo(question.id);
    List<Reports> reportLists = List.of(state.reportList);
    reportLists.insert(index,question);
    state = state.copyWith(reportList: reportLists);
    localsave();
  }

  void removeTodo(String id) {
    final edditedlist =
        state.reportList.where((state) => state.id != id).toList();
    final edditedstate = state.copyWith(reportList: edditedlist);
    state = edditedstate;
    localsave();
  }



  
 
  
  }
