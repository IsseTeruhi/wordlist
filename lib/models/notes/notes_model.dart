// ./User.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordlistandtest_app/models/questions/questions_model.dart';

// 自動生成したコードを取り込む
part 'notes_model.freezed.dart';
part 'notes_model.g.dart';

// モデル定義
@freezed
abstract class Notes implements _$Notes {
  const Notes._();
  const factory Notes({
    required String text,
    required DateTime addtime,
    required String id,
    required List<Questions> qlist,
  }) = _Notes;

  factory Notes.empty() =>
      Notes(text: '', addtime: DateTime.now(), id: '', qlist: []);

  factory Notes.fromJson(Map<String, dynamic> json) => _$NotesFromJson(json);
}
