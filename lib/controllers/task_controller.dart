import 'package:get/get.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/task_api.dart';

class TaskController extends GetxController {
  final tasks = <TodoModel>[].obs;

  final searchText = "".obs;

  final uncheckedTasks = false.obs;

  Iterable<TodoModel?> get filteredTodos => tasks
      .where((todo) => !uncheckedTasks.value || !todo.isCompleted)
      .where((todo) => todo.text.toLowerCase().contains(searchText.value.toLowerCase()));

  @override
  void onInit() {
    super.onInit();
    getTasks();
  }

  Future<void> addTask(String task) async {
    final todo = await TaskApi.addTask(task);
    if (todo != null) {
      tasks.add(todo);
    }
  }

  void getTasks() async {
    tasks.value = await TaskApi.getTasks();
  }

  void deleteTask(String id) async {
    final deletedID = await TaskApi.deleteTask(id);
    if (deletedID != null) {
      tasks.removeWhere((todo) => todo.id == deletedID);
    }
  }

  void editTask(String text, String id) async {
    final editedID = await TaskApi.updateTask(id, text);
    if (editedID == null) return;
    final todo = tasks.firstWhere((todo) => todo.id == id);
    todo.text = text;
    tasks.refresh();
  }

  void toggle(String id) async {
    final todo = tasks.firstWhere((todo) => todo.id == id);
    final targetCompleted = !todo.isCompleted;
    final completed = await TaskApi.toggleTask(id, targetCompleted);
    if (completed == null) return;
    todo.isCompleted = completed;
    tasks.refresh();
  }
}
