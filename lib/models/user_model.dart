class UserModel {
  final String id;
  final String? name;
  final String? email;

  UserModel(this.id, this.name, this.email);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id'] ?? '',
      map['name'] ?? '',
      map['email'] ?? '',
    );
  }
}
