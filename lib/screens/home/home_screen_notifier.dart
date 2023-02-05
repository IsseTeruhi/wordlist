//状態管理のファイル
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  (ref) => HomeScreenNotifier(HomeScreenState(notelist: [])),
);

class HomeScreenNotifier extends StateNotifier<HomeScreenState> {
  //ログイン・ログアウトするたびに状態をアップデート

  HomeScreenNotifier(HomeScreenState state) : super(state) {
    //ここに初期処理を書く
    initState();
    //例　ローカルのデータベースの初期処理
  }
  //状態処理のプログラムをここでまとめている
  final bool _isLoading = false;

  final GlobalKey<FormState> formKey =
      GlobalObjectKey<FormState>('LoginNotifier');

  Future<void> initState() async {}

  @override
  void dispose() {
    super.dispose();
  }

  // state は immutable なため、copyWith で複製する
  void add(Notes note) {
    List<Notes> newNotes = [...state.notelist, note];
    state = state.copyWith(notelist: newNotes);
  }
  void delete(Notes note) {
    List<Notes> newNotes = [...state.notelist, note];
    state = state.copyWith(notelist: newNotes);
  }


 
}
