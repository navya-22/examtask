import 'package:examtask/services/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
var database;

Future<void>initial()async {
  database =await openDatabase(
    join(await getDatabasesPath(), 'user_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user(id TEXT PRIMARY KEY, name TEXT, age TEXT)',
      );
    },
    version: 1,
  );
}

Future<void> insertUser(User user) async {
  final db = await database;
  await db.insert(
    'user',
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
Future<List<User>> getUser() async {
  final db = await database;
  final List<Map<String, dynamic>> userMaps = await db.query('user');
    print('database data :${userMaps}');
  List<User> userData = List.generate(userMaps.length, (i)
  {
    return User(
      id: userMaps[i]['id'],
      name: userMaps[i]['name'],

      age: userMaps[i]['age'],
    );
  });

  print('userList${userData}');

  return  userData;
}