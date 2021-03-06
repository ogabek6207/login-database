class UserModel {
  UserModel({
    this.id = 0,
    required this.name,
    required this.surname,
    required this.login,
    required this.password,
  });

  int id;
  String name;
  String surname;
  String login;
  String password;

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "login": login,
        "password": password,
      };
}
