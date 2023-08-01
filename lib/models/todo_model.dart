class TodoModel {
  final String userId;
  final String id;
  String text;
  bool isCompleted;
  final DateTime createdAt;

  TodoModel({
    required this.userId,
    required this.id,
    required this.text,
    required this.isCompleted,
    required this.createdAt,
  });

  

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'userId': userId});
    result.addAll({'id': id});
    result.addAll({'text': text});
    result.addAll({'isCompleted': isCompleted});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});
  
    return result;
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      userId: map['userId'] ?? '',
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }
}
