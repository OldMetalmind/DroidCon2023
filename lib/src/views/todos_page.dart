import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/src/blocs/task_cubit.dart';

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
        },
      ),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return state.status.when(
            initial: () {
              // TODO Load task
              // TODO Show loading indicator
              throw UnimplementedError();
            },
            loading: () {
              // TODO Load task
              // TODO Show loading indicator
              throw UnimplementedError();
            },
            success: () {
              // TODO Show View
              throw UnimplementedError();
            },
            failure: (error) {
              /// TODO Show error
              throw UnimplementedError();
            },
          );
        },
      ),
    );
  }
}
