import 'package:flutter/material.dart';
import 'package:workshop/src/models/task_model.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    /// TODO: Add Icon book_outlined
    /// TODO: Add description
    /// TODO: On long press, delete task.
    return ListTile(
      title: Text(task.task),
    );
  }
}
