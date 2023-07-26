// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final String id;
  String text;
  bool isCompleted;
  final DateTime createdAt;

  TodoModel({
    required this.id,
    required this.text,
    required this.isCompleted,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'isCompleted': isCompleted,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    late final DateTime createdAt;

    if (map["createdAt"] != null) {
      createdAt = (map["createdAt"] as Timestamp).toDate();
    } else {
      createdAt = DateTime.now();
    }

    return TodoModel(
      id: map['id'] as String,
      text: map['text'] as String,
      isCompleted: map['isCompleted'] as bool,
      createdAt: createdAt,
    );
  }
}
