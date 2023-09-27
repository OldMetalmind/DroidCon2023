part of 'task_cubit.dart';

@freezed
class TaskState with _$TaskState {
  const TaskState._();

  factory TaskState({
    required TaskStatus status,
    required List<Task> tasks,
  }) = _TaskState;

  factory TaskState.initial({List<Task> tasks = const []}) {
    return TaskState(
      status: const TaskStatus.initial(),
      tasks: tasks,
    );
  }
}

@freezed
class TaskStatus with _$TaskStatus {
  const factory TaskStatus.initial() = Initial;

  const factory TaskStatus.loading() = Loading;

  const factory TaskStatus.success() = Success;

  const factory TaskStatus.failure(Error error) = Failure;
}

extension TaskStatusExtension on TaskStatus {
  bool get isInitial => this is Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isFailure => this is Failure;
}
