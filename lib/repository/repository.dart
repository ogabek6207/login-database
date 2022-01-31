import 'package:login/database/database_helper.dart';
import 'package:login/model/user_model.dart';

class Repository {
  DatabaseHelper databaseHelper = DatabaseHelper();

  //user
  Future<int> saveUser(UserModel item) => databaseHelper.saveUser(item);

  //user
  Future<List<UserModel>> getUsers() => databaseHelper.getUsers();

  //user
  Future<int> deleteUser(int id) => databaseHelper.deleteUser(id);

  //user
  Future<int> updateUser(UserModel products) =>
      databaseHelper.updateUser(products);
}
