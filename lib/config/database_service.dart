import 'package:dd/config/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _database = DatabaseService._internal();
  late Future<Database> database;

  factory DatabaseService() => _database;

  DatabaseService._internal() {
    databaseConfig();
  }

  Future<bool> databaseConfig() async {
    try {
      database = openDatabase(
        join(await getDatabasesPath(), 'userdata.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE user(id TEXT PRIMARY KEY, age INTEGER, gender TEXT, hypertension INTEGER, heart_disease INTEGER, ever_married INTEGER, work_type TEXT, residence_type INTEGER, avg_glucose_level REAL, bmi REAL, tel TEXT)'
          );
        },
        version: 1
      );
      return true;
    } catch(e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> insertUser(User user) async {
    final db = await database;
    try {
      db.insert('user', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      return true;
    } catch(e) {
      return false;
    }
  }

  Future<List<User>> getUser() async {
    final Database db = await database;
    final List<Map<String, dynamic>> data = await db.query('user');

    return List.generate(data.length, (idx) {
      return User.fromMap(data[idx]);
    });
  }
}
