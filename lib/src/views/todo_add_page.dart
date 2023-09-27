import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/src/blocs/task_cubit.dart';
import 'package:workshop/src/models/task_model.dart';

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});

  @override
  State<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _deadline;

  final _taskController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Task'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Task
                    TextFormField(
                      autofocus: true,
                      controller: _taskController,
                      validator: isNotEmpty,
                      textInputAction:
                          TextInputAction.next, // Moves focus to next.

                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Task',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Description
                    TextFormField(
                      maxLines: 3,
                      controller: _descriptionController,
                      textInputAction:
                          TextInputAction.done, // Moves focus to next.
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description (Optional)',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Date
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _deadline?.toIso8601String().split('T')[0] ??
                                  'Deadline (Optional)',
                            ),
                          ),
                          const Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final newTask = Task(
                            task: _taskController.text,
                            description: _descriptionController.text,
                            created: DateTime.now(),
                            deadline: _deadline,
                          );

                          context.read<TaskCubit>().addTask(newTask);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String? isNotEmpty(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  /// Source: https://api.flutter.dev/flutter/material/showDatePicker.html
  Future<void> _selectDate(BuildContext context) async {
    throw UnimplementedError();

    /// TODO call showDatePicker()
  }
}
