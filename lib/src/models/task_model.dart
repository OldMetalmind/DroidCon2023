import 'package:freezed_annotation/freezed_annotation.dart';

// ignore: unnecessary_import

part 'task_model.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    required String task,
    String? description,
    required DateTime created,
    @Default(false) bool done,
    DateTime? deadline,
  }) = _Task;
}
