import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo/models/todo_model.dart';

class TaskController extends GetxController {
  final tasks = <TodoModel>[].obs;

  FirebaseFirestore tasksInstance = FirebaseFirestore.instance;

  final searchText = "".obs;

  int idCounter = DateTime.now().microsecondsSinceEpoch;

  final uncheckedTasks = false.obs;

  Iterable<TodoModel?> get filteredTodos => tasks
      .where((todo) => !uncheckedTasks.value || !todo.isCompleted)
      .where((todo) =>
          todo.text.toLowerCase().contains(searchText.value.toLowerCase()));

  @override
  void onInit() {
    super.onInit();
    getTasks();
  }

  Future<void> addTask(String task) async {
    TodoModel todo = TodoModel(id: idCounter, text: task, isCompleted: false);

    tasks.add(todo);

    tasksInstance.collection('todo').doc('${todo.id}').set(todo.toFirestore());
  }

  void getTasks() {
    tasksInstance.collection('todo').get().then(
            (todos) {
              print('Tasks are taken!');
              for (var task in todos.docs) {
                print('${task.id} => ${task.data()}');
                tasks.add(TodoModel.fromFirestore(task, null));
              }
            },
      onError: (e) => print('Failed to take the tasks: $e'),
    );


  }

  void deleteTask(int id) {
    tasks.removeWhere((todo) => todo.id == id);

    tasksInstance.collection('todo')
        .doc('$id')
        .delete()
        .then((value) => print("Task deleted!"))
        .catchError((error) => print("Failed to delete task: $error"));
  }

  void editTask(String text, int id) {
    final todo = tasks.firstWhere((todo) => todo.id == id);

    tasksInstance.collection('todo')
        .doc('$id')
        .update({'text': text})
        .then((value) => print("Task updated!"))
        .catchError((error) => print("Failed to update task: $error"));

    todo.text = text;
    tasks.refresh();
  }

  void toggle(int id) {
    final todo = tasks.firstWhere((todo) => todo.id == id);

    todo.isCompleted = !todo.isCompleted;

    tasksInstance.collection('todo')
        .doc('$id')
        .update({'isCompleted': todo.isCompleted})
        .then((value) => print("Task updated!"))
        .catchError((error) => print("Failed to update task: $error"));

    tasks.refresh();
  }
}
