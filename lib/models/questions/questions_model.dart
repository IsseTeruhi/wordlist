// ./User.dart
import 'package:freezed_annotation/freezed_annotation.dart';

// 自動生成したコードを取り込む
part 'questions_model.freezed.dart';

// モデル定義
@freezed
class Questions with _$Questions {
  const factory Questions({
    required String state,
    required String image,
    required List <String> option,
    required String answer,
    required String explain,
    required String noteid,
  }) = _Questions;
}
