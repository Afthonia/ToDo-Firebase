import 'dart:async';

import 'package:get/get.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/task_api.dart';

class TaskController extends GetxController {
  static TaskController taskController = Get.find<TaskController>();

  final tasks = <TodoModel>[].obs;

  final searchText = "".obs;

  final uncheckedTasks = false.obs;

  late final StreamSubscription<List<TodoModel>> getTasksHandle;

  Iterable<TodoModel?> get filteredTodos => tasks
      .where((todo) => !uncheckedTasks.value || !todo.isCompleted)
      .where((todo) => todo.text.toLowerCase().contains(searchText.toLowerCase()));
  

  @override
  void onInit() {
    // ever(searchText, (val) {
    //   print(val);
    // });

    super.onInit();

    getTasks();



    // debounce(searchText, (newSearchText) {
    //   filteredTodos.value = tasks
    // .where((todo) => !uncheckedTasks.value || !todo.isCompleted)
    // .where((todo) => todo.text.toLowerCase().contains(searchText.toLowerCase())).toList();
    //     },
    // time: 2.seconds
    // );
  }

  Future<void> addTask(String task) async {
    final todo = await TaskApi.addTask(task);
    if (todo != null) {
      tasks.add(todo);
    }
  }

  void getTasks() {
    getTasksHandle = TaskApi.getTasks().listen((todoList) {
      tasks.value = todoList;
    });
  }

  void deleteTask(String id) async {
    await TaskApi.deleteTask(id);
  }

  void editTask(String text, String id) async {
    await TaskApi.updateTask(id, text);
  }

  void toggle(String id) async {
    final todo = tasks.firstWhere((todo) => todo.id == id);
    final targetCompleted = !todo.isCompleted;
    await TaskApi.toggleTask(id, targetCompleted);
  }

  @override
  void onClose() {
    getTasksHandle.cancel();
    super.onClose();
  }
}
