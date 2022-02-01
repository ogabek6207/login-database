import 'package:flutter/material.dart';
import 'package:login/model/user_model.dart';
import 'package:login/repository/repository.dart';

class NewPasswordScreen extends StatefulWidget {
  final String name;
  final String surname;
  final int userId;

  const NewPasswordScreen({
    Key? key,
    required this.name,
    required this.surname,
    required this.userId,
  }) : super(key: key);

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurName = TextEditingController();
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final Repository _repository = Repository();

  @override
  void initState() {
    _controllerName.text = widget.name;
    _controllerSurName.text = widget.surname;
    setState(() {});
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "New Password",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              readOnly: true,
              controller: _controllerName,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "name",
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              readOnly: true,
              controller: _controllerSurName,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "surname",
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _controllerLogin,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "new login",
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _controllerPassword,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "new password",
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              if (_controllerPassword.text.length >= 3 &&
                  _controllerLogin.text.length >= 3) {
                int userId = await _repository.updateUser(
                  UserModel(
                    id: widget.userId,
                    name: _controllerName.text,
                    surname: _controllerSurName.text,
                    login: _controllerLogin.text,
                    password: _controllerPassword.text,
                  ),
                );
                if (userId > 0) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
              }
            },
            child: Container(
              height: 52,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
