import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final int id;
  String text;
  bool isCompleted;

  TodoModel({
    required this.id,
    required this.text,
    required this.isCompleted,
  });

  factory TodoModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();

    return TodoModel(
        id: data?['id'], text: data?['text'], isCompleted: data?['isCompleted']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'text': text,
      'isCompleted': isCompleted,
    };
  }
}
