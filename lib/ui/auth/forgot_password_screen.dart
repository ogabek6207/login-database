import 'package:flutter/material.dart';
import 'package:login/dialog/center_dialog.dart';
import 'package:login/model/user_model.dart';
import 'package:login/repository/repository.dart';
import 'package:login/ui/auth/new_password_screen.dart';

class ForgetPassWordScreen extends StatefulWidget {
  const ForgetPassWordScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ForgetPassWordScreenState createState() => _ForgetPassWordScreenState();
}

class _ForgetPassWordScreenState extends State<ForgetPassWordScreen> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurName = TextEditingController();
  final Repository _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Forgot Password",
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
          GestureDetector(
            onTap: () async {
              _getData();
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

  _getData() async {
    List<UserModel> result = await _repository.getUsers();
    bool k = false;
    int userId = 0;
    for (int i = 0; i < result.length; i++) {
      if (result[i].name == _controllerName.text &&
          result[i].surname == _controllerSurName.text) {
        k = true;
        userId == result[i].id;
        break;
      }
    }
    if (k) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return NewPasswordScreen(
              name: _controllerName.text,
              surname: _controllerSurName.text,
              userId: userId,
            );
          },
        ),
      );
    } else {
      CenterDialog.showErrorDialog(context, "Login yoki parol xato");
    }
  }
}
