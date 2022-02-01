import 'package:flutter/material.dart';
import 'package:login/repository/repository.dart';

import '../model/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurName = TextEditingController();
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final Repository _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Register",
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
                labelText: "login",
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
                labelText: "password",
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              if (_controllerName.text.length >= 3) {
                int userId = await _repository.saveUser(
                  UserModel(
                    name: _controllerName.text,
                    surname: _controllerSurName.text,
                    login: _controllerLogin.text,
                    password: _controllerPassword.text,
                  ),
                );
                if (userId >= 0) {
                  Navigator.pop(context);
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
