class User {
  final String id;
  final String name;
  final String age;

  const User({
    required this.id,
    required this.name,
    required this.age,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, age: $age}';
  }
}
