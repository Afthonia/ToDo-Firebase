import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/models/todo_model.dart';

class TaskApi {
  static Stream<List<TodoModel>> getTasks() {
    try {
      final todos = FirebaseFirestore.instance.collection('todos').snapshots();
      return todos.map((e) => e.docs.map((e) => TodoModel.fromMap(e.data())).toList());
    } catch (e) {
      debugPrint("Get Tasks Error: $e");
    }
    return Stream.value([]);
  }

  static Future<TodoModel?> addTask(String task) async {
    try {
      final doc = FirebaseFirestore.instance.collection('todos').doc();
      final todo = TodoModel(id: doc.id, text: task, isCompleted: false, createdAt: DateTime.now());
      await doc.set(todo.toMap());
      return todo;
    } catch (e) {
      debugPrint("Add Task Error: $e");
    }

    return null;
  }

  static Future<String?> deleteTask(String id) async {
    try {
      await FirebaseFirestore.instance.collection('todos').doc(id).delete();

      return id;
    } catch (e) {
      debugPrint("Delete Task Error: $e");
    }
    return null;
  }

  static Future<String?> updateTask(String id, String text) async {
    try {
      await FirebaseFirestore.instance.collection('todos').doc(id).update({'text': text});
      return id;
    } catch (e) {
      debugPrint("Update Task Error: $e");
    }
    return null;
  }

  static Future<bool?> toggleTask(String id, bool completed) async {
    try {
      await FirebaseFirestore.instance
          .collection('todos')
          .doc(id)
          .update({'isCompleted': completed});

      return completed;
    } catch (e) {
      debugPrint("Toggle Task Error: $e");
    }

    return null;
  }
}
