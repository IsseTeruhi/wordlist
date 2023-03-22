//状態管理のファイル
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:wordlistandtest_app/common/constants.dart';
import 'package:wordlistandtest_app/models/questions/questions_model.dart';

part 'add_quiz_notifier.freezed.dart';

//状態 ( state ) を保持することを責務とする。
////Immutable な CounterState を宣言
////NullSafety 対応のため デフォルト値を宣言
@freezed
class AddQuizState with _$AddQuizState {
  const factory AddQuizState({
    required int currentIndex,
    required List<Questions> quizList, //状態管理したいものを入れる
  }) = _AddQuizState;
}

//
final quizProvider = StateNotifierProvider<AddQuizNotifier, AddQuizState>(
  (ref) => AddQuizNotifier(ref)..initState(),
);

class AddQuizNotifier extends StateNotifier<AddQuizState> {
  final Ref ref;
  //ログイン・ログアウトするたびに状態をアップデート

  AddQuizNotifier(this.ref)
      : super(AddQuizState(
          currentIndex: 0,
          quizList: [],
        )) {
    //ここに初期処理を書く
    initState();
    //例　ローカルのデータベースの初期処理
  }
  //状態処理のプログラムをここでまとめている

 

  Future<void> initState() async {
    //WidgetsBinding.instance.addPostFrameCallback((_) => ref.read(quizProvider.notifier).state=questions(text: "", addtime: DateTime.now(), id: "", qlist: []));
    //build完了時　=>以降の処理(ref.read....)
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> localsave() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Questions> savequestion = state.quizList;
    List<String> data = savequestion.map((e) => jsonEncode(e)).toList();
    prefs.setStringList('quizList', data);
  }

  Future<void> localroad(String noteId) async {
    print('nodeID;$noteId');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('quizList');
    if (data != null) {
      List<Questions> allQuestions =
          data.map((e) => Questions.fromJson(jsonDecode(e))).toList();
      print('全データ:$allQuestions ');

      state = state.copyWith(
          quizList: allQuestions
              .where((element) => element.noteid == noteId)
              .toList());
    }
  }

  void addNewQuestion(String noteid) {
     final uuid = const Uuid();
     final _uuid = uuid.v4();
    Questions question = Questions(
        id:_uuid,
        text: '',
        image: '',
        option: [],
        answer: '',
        explain: '',
        noteid: noteid);
    List<Questions> newquestions = [...state.quizList, question];
    state = state.copyWith(quizList: newquestions);
    localsave();
  }

  // state は immutable なため、copyWith で複製する
  void updateQuestion(Questions question,int index) {

removeTodo(question.id);
    List<Questions> quizLists = List.of(state.quizList);
    quizLists.insert(index,question);
    state = state.copyWith(quizList: quizLists);
    localsave();
  }

  void removeTodo(String id) {
    final edditedlist =
        state.quizList.where((state) => state.id != id).toList();
    final edditedstate = state.copyWith(quizList: edditedlist);
    state = edditedstate;
    localsave();
  }

  // void updatequestion(Questions question) {
  //   removeTodo(question.id);
  //   addquestion(question);
  // }
}
