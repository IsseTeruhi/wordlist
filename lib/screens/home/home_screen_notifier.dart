//状態管理のファイル
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordlistandtest_app/screens/configue_list.dart';

import '../../models/notes/notes_model.dart';


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

  HomeScreenNotifier(this.ref) : super(HomeScreenState( notelist: [])) {
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
  
Future<void> localsave () async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<Notes> savenote =state.notelist;
  List<String> data= savenote.map((e) => jsonEncode(e)).toList();
  prefs.setStringList('lnotelist',  data);
}
Future<void> localroad () async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final data = prefs.getStringList('lnotelist');
    if (data != null) {
       List<Notes> loadnote= data.map((e) => Notes.fromJson(jsonDecode(e))).toList();
       state=state.copyWith(notelist: loadnote);
    }
    
  }


  // state は immutable なため、copyWith で複製する
void addnote(Notes note) {
    List<Notes> newNotes = [...state.notelist, note];
    state = state.copyWith(notelist: newNotes);
    localsave();
  }
void removeTodo(String id) {
    final edditedlist =state.notelist.where((state) => state.id != id).toList();
    final edditedstate =state.copyWith(notelist: edditedlist);
    state = edditedstate;
    localsave();
  }
void updatenote(Notes note ){
  removeTodo(note.id);
   addnote(note); 
  }


 

 
}
