import 'dart:convert';

import 'package:workshop/src/models/task_model.dart';
import 'package:workshop/src/networking/todo_http_client.dart';

/// Use the repository to parse the responses to a proper object and catch any
/// network errors
class TodoRepository {
  late final TodoHttpClient _todoHttpClient;

  TodoRepository({
    TodoHttpClient? todoHttpClient,
  }) {
    _todoHttpClient = todoHttpClient ?? TodoHttpClient();
  }

  Future<Task> getTodoById(String id) async {
    final response = await _todoHttpClient.getTodoById(id);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Task.fromJson(json);
    } else {
      throw Exception('Failed to load todo');
    }
  }

  Future<void> getTodos() async {
    await _todoHttpClient.getTodos();
  }

  Future<void> addTodo(Task task) async {
    await _todoHttpClient.addTodo(task);
  }

  Future<void> updateTodoById(String id, Task task) async {
    await _todoHttpClient.updateTodoById(id, task);
  }

  Future<void> deleteTodoById(String id) async {
    await _todoHttpClient.deleteTodoById(id);
  }

  Future<void> deleteAllTodos() async {
    await _todoHttpClient.deleteAllTodos();
  }
}
