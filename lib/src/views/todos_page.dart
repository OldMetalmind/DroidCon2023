import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/src/blocs/task_cubit.dart';
import 'package:workshop/src/navigation/navigation.dart';
import 'package:workshop/src/views/todos_page_view.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          /// Navigate where?
          context.toAddPage();
        },
      ),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return state.status.when(
            initial: () {
              context.read<TaskCubit>().loadTasks();
              return const CircularProgressIndicator();
            },
            loading: () {
              return const CircularProgressIndicator();
            },
            success: () {
              return const TasksPageView();
            },
            failure: (error) {
              return Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
