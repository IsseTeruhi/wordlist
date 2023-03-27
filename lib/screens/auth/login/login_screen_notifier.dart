//状態管理のファイル
import 'dart:convert';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'login_screen_notifier.freezed.dart';

//状態 ( state ) を保持することを責務とする。
////Immutable な CounterState を宣言
////NullSafety 対応のため デフォルト値を宣言
@freezed
class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState({
//状態管理したいものを入れる
  }) = _LoginScreenState;
}

//
final loginScreenProvider =
    StateNotifierProvider<LoginScreenNotifier, LoginScreenState>(
  (ref) => LoginScreenNotifier(ref)..initState(),
);

class LoginScreenNotifier extends StateNotifier<LoginScreenState> {
  final Ref ref;
  //ログイン・ログアウトするたびに状態をアップデート

  LoginScreenNotifier(this.ref) : super(LoginScreenState()) {
    //ここに初期処理を書く
    initState();
    //例　ローカルのデータベースの初期処理
  }
  //状態処理のプログラムをここでまとめている
 



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
    
  }

  Future<void> localroad() async {
    
  }

  
}
