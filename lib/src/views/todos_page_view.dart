import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/src/blocs/task_cubit.dart';
import 'package:workshop/src/widgets/task_list_item.dart';

class TasksView extends StatelessWidget {
  const TasksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      buildWhen: (previous, current) {
        return previous.tasks != current.tasks;
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.tasks.length,
          itemBuilder: (context, index) {
            final task = state.tasks[index];
            return TaskListItem(task: task);
          },
        );
      },
    );
  }
}
