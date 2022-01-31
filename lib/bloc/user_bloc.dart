import 'package:login/model/user_model.dart';
import 'package:login/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final _repository = Repository();
  final userFetch = PublishSubject<List<UserModel>>();

  Stream<List<UserModel>> get fetchUser => userFetch.stream;

  getUsers() async {
    var results = await _repository.getUsers();
    userFetch.sink.add(results);
  }

  dispose() {
    userFetch.close();
  }
}

final userBloc = UserBloc();
