// ./User.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordlistandtest_app/models/questions/questions_model.dart';

// 自動生成したコードを取り込む
part 'notes_model.freezed.dart';

// モデル定義
@freezed
class Notes with _$Notes {
  const factory Notes({
    required String text,
    required DateTime addtime,
    required String id,
    required List<Questions> qlist,
  }) = _Notes;
}
