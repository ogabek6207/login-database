import 'dart:async';
import 'package:login/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  //user
  final String tableUser = 'userTable';
  final String columnUserId = 'id';
  final String columnUserName = 'name';
  final String columnUserSurname = 'surname';
  final String columnUserLogin = 'login';
  final String columnUserPassword = 'password';


  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'login.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    // user
    await db.execute('CREATE TABLE $tableUser('
        '$columnUserId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$columnUserName TEXT, '
        '$columnUserSurname TEXT, '
        '$columnUserLogin TEXT,'
        '$columnUserPassword TEXT)');


  }

  //user save
  Future<int> saveUser(UserModel item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      tableUser,
      item.toJson(),
    );
    return result;
  }

  //user get
  Future<List<UserModel>> getUsers() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableUser');
    List<UserModel> products = <UserModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = UserModel(
        id: list[i][columnUserId],
        name: list[i][columnUserName],
        surname: list[i][columnUserSurname],
        login: list[i][columnUserLogin],
        password: list[i][columnUserPassword],
      );
      products.add(items);
    }
    return products;
  }


  //user update

  Future<int> updateUser(UserModel products) async {
    var dbClient = await db;
    return await dbClient.update(
      tableUser,
      products.toJson(),
      where: "$columnUserId = ?",
      whereArgs: [products.id],
    );
  }
  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableUser,
      where: '$columnUserId = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }


}
