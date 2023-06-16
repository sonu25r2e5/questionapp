class Todo {
  String name;
  bool completed;
  Todo(this.name, this.completed);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'completed': completed});

    return result;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      map['name'] ?? '',
      map['completed'] ?? false,
    );
  }
}
