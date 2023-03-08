//状態管理のファイル
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
final AddQuizProvider =
    StateNotifierProvider<AddQuizNotifier, AddQuizState>(
  (ref) => AddQuizNotifier(ref)..initState(),
);

class AddQuizNotifier extends StateNotifier<AddQuizState> {
  final Ref ref;
  //ログイン・ログアウトするたびに状態をアップデート

  AddQuizNotifier(this.ref) : super(AddQuizState(currentIndex:0, quizList: [],)) {
    //ここに初期処理を書く
    initState();
    //例　ローカルのデータベースの初期処理
  }
  //状態処理のプログラムをここでまとめている
  final bool _isLoading = false;

  final GlobalKey<FormState> formKey =
      GlobalObjectKey<FormState>('LoginNotifier');

  Future<void> initState() async {
    localroad();
    //WidgetsBinding.instance.addPostFrameCallback((_) => ref.read(noteProvider.notifier).state=Notes(text: "", addtime: DateTime.now(), id: "", qlist: []));
    //build完了時　=>以降の処理(ref.read....)
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> localsave() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Questions> savenote = state.quizList;
    List<String> data = savenote.map((e) => jsonEncode(e)).toList();
    prefs.setStringList('quizList', data);
  }

  Future<void> localroad() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('quizList');
    if (data != null) {
      List<Questions> loadnote =
          data.map((e) => Questions.fromJson(jsonDecode(e))).toList();
      state = state.copyWith(quizList: loadnote);
    }
  }

  // state は immutable なため、copyWith で複製する
  void addnote(Questions note) {
    List<Questions> newNotes = [...state.quizList, note];
    state = state.copyWith(quizList: newNotes);
    localsave();
    supabaseSave(note);
  }

  Future<void> supabaseSave(Questions note) async {
    final updates = {
      'id': note.id,
     
    };
    try {
      await supabase.from('Notes').upsert(updates);
      if (mounted) {
        print(mounted);
        //context.showSnackBar(message: 'Successfully updated profile!');
      }
    } catch (error) {
      print(error); // context.showErrorSnackBar(message: error.message);
    }
  }

  void removeTodo(String id) {
    final edditedlist =
        state.quizList.where((state) => state.id != id).toList();
    final edditedstate = state.copyWith(quizList: edditedlist);
    state = edditedstate;
    localsave();
  }

  void updatenote(Questions note) {
    removeTodo(note.id);
    addnote(note);
  }
}
