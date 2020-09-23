import 'dart:convert';

class TodoModel {
  final int id;
  final String todo;

  TodoModel({
    this.id,
    this.todo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todo': todo,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TodoModel(
      id: map['id'],
      todo: map['todo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));
}
