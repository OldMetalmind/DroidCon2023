import 'package:workshop/src/models/task_model.dart';
import 'package:workshop/src/repository/todo_repository.dart';

/// Service used to abstract the repository from the UI and used with the state
/// management.
class TodoService {
  late final TodoRepository _todoRepository;

  TodoService({
    TodoRepository? todoRepository,
  }) {
    _todoRepository = todoRepository ?? TodoRepository();
  }

  void getAllTodos() async {
    throw UnimplementedError();
  }

  Future<Task> getTodoById(int id) async {
    return _todoRepository.getTodoById(id.toString());
  }

  Future<void> addTodo(Task todo) async {
    return _todoRepository.addTodo(todo);
  }

  Future<void> updateTodo(Task todo) async {
    return _todoRepository.updateTodoById(todo.hashCode.toString(), todo);
  }

  Future<void> deleteTodoById(int id) async {
    return _todoRepository.deleteTodoById(id.toString());
  }
}
