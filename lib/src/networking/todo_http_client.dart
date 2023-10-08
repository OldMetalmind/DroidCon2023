import 'package:http/http.dart' as http;
import 'package:workshop/src/models/task_model.dart';
import 'package:workshop/src/networking/http_client.dart';

class TodoHttpClient extends NetworkClient {
  @override
  String get baseUrl => throw UnimplementedError();

  Future<http.Response> getTodos() {
    return http.get(Uri.parse(baseUrl));
  }

  Future<http.Response> getTodoById(String id) {
    return http.get(Uri.parse('$baseUrl/$id'));
  }

  Future<http.Response> addTodo(Task task) {
    return http.post(Uri.parse(baseUrl), body: task);
  }

  Future<http.Response> updateTodoById(String id, Task task) {
    return http.put(Uri.parse('$baseUrl/$id'), body: task);
  }

  Future<http.Response> deleteTodoById(String id) {
    return http.delete(Uri.parse('$baseUrl/$id'));
  }

  Future<http.Response> deleteAllTodos() {
    return http.delete(Uri.parse(baseUrl));
  }
}
