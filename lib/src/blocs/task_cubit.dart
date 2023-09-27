import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workshop/src/models/task_model.dart';

part 'task_cubit.freezed.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> with LoadingMixin<TaskCubit> {
  TaskCubit() : super(TaskState.initial());

  Future<void> loadTasks() async {
    emitLoading();
    try {
      /// Pretending to load tasks from the server.
      await Future.delayed(const Duration(seconds: 2));
      emit(
        state.copyWith(
          status: const TaskStatus.success(),
          tasks: [],
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: TaskStatus.failure(error as Error),
        ),
      );
    }
  }

  Future<void> addTask(Task task) async {
    emitLoading();
    emit(state.copyWith(status: const TaskStatus.loading()));
    try {
      emit(
        state.copyWith(
          status: const TaskStatus.success(),
          tasks: [...state.tasks, task],
        ),
      );
      emit(state.copyWith(status: const TaskStatus.success()));
    } catch (error) {
      emit(
        state.copyWith(
          status: TaskStatus.failure(error as Error),
        ),
      );
    }
  }

  Future<void> deleteTask(Task task) async {
    emitLoading();
    try {
      emit(
        state.copyWith(
          status: const TaskStatus.success(),
          tasks: state.tasks.where((t) => t != task).toList(),
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: TaskStatus.failure(error as Error),
        ),
      );
    }
  }
}

mixin LoadingMixin<TaskCubit> on Cubit<TaskState> {
  void emitLoading() {
    emit(state.copyWith(status: const TaskStatus.loading()));
  }
}
