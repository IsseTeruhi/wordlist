//状態管理のファイル
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordlistandtest_app/common/constants.dart';
import '../../models/notes/notes_model.dart';
import '../../models/questions/questions_model.dart';

part 'home_screen_notifier.freezed.dart';

//状態 ( state ) を保持することを責務とする。
////Immutable な CounterState を宣言
////NullSafety 対応のため デフォルト値を宣言
@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    required List<Notes> notelist, //状態管理したいものを入れる
  }) = _HomeScreenState;
}

//
final homeScreenProvider =
    StateNotifierProvider<HomeScreenNotifier, HomeScreenState>(
  (ref) => HomeScreenNotifier(ref)..initState(),
);

class HomeScreenNotifier extends StateNotifier<HomeScreenState> {
  final Ref ref;
  //ログイン・ログアウトするたびに状態をアップデート

  HomeScreenNotifier(this.ref) : super(HomeScreenState(notelist: [])) {
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
    List<Notes> savenote = state.notelist;
    List<String> data = savenote.map((e) => jsonEncode(e)).toList();
    prefs.setStringList('lnotelist', data);
  }

  Future<void> localroad() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('lnotelist');
    if (data != null) {
      List<Notes> loadnote =
          data.map((e) => Notes.fromJson(jsonDecode(e))).toList();
      state = state.copyWith(notelist: loadnote);
    }
  }

  // state は immutable なため、copyWith で複製する
  void addnote(Notes note) {
    List<Notes> newNotes = [...state.notelist, note];
    state = state.copyWith(notelist: newNotes);
    localsave();
    supabaseSave(note);
  }

  Future<void> supabaseSave(Notes note) async {
    final updates = {
      'id': note.id,
      'addtime': note.addtime.toIso8601String(),
      'text': note.text,
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

  void removeTodo(String id) async {
    final edditedlist =
        state.notelist.where((state) => state.id != id).toList();
    final edditedstate = state.copyWith(notelist: edditedlist);

    state = edditedstate;
    deleteQuestions(id);
    localsave();
  }
}

void deleteQuestions(String id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final data = prefs.getStringList('quizList');
  if (data != null) {
    List<Questions> allQuestions =
        data.map((e) => Questions.fromJson(jsonDecode(e))).toList();

    List<Questions> questions =
        allQuestions.where((element) => element.noteid != id).toList();

    List<String> udata = questions.map((e) => jsonEncode(e)).toList();
    prefs.setStringList('quizList', udata);
  }
}
