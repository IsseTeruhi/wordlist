// ./User.dart
import 'package:freezed_annotation/freezed_annotation.dart';

// 自動生成したコードを取り込む
part 'reports_model.freezed.dart';
part 'reports_model.g.dart';

// モデル定義
@freezed
class Reports with _$Reports {
  const factory Reports({
    required String id,
    required String noteid,
    required String questionid,
    required String selected,
    required bool iscorrect,
    required DateTime timestamp,
  }) = _Reports;

  factory Reports.fromJson(Map<String, dynamic> json) => _$ReportsFromJson(json);
}
