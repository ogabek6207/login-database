import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isNext = false;

  @override
  void initState() {
    _loginController.addListener(() {
      if (_loginController.text.length > 3 &&
          _passwordController.text.length > 3) {
        setState(() {
          isNext = true;
        });
      } else {
        setState(() {
          isNext = false;
        });
      }
    });
    _passwordController.addListener(() {
      if (_loginController.text.length > 3 &&
          _passwordController.text.length > 3) {
        setState(() {
          isNext = true;
        });
      } else {
        setState(() {
          isNext = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: w,
                  margin: const EdgeInsets.only(
                    left: 32,
                    top: 32,
                    bottom: 12,
                  ),
                  child: Text(
                    'Вход в аккаунт',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: w,
                  margin: const EdgeInsets.only(left: 32),
                  child: Text(
                    'Введите логин и пароль вашего аккаунта',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: w,
                  height: 60,
                  margin: const EdgeInsets.only(left: 32, right: 32, top: 32),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5, color: Colors.black),
                    ),
                  ),
                  child: TextField(
                    controller: _loginController,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                        labelText: "Введите логин",
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Container(
                  width: w,
                  height: 60,
                  margin: const EdgeInsets.only(left: 32, right: 32, top: 24),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5, color: Colors.black),
                    ),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: isHiddenPassword,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _toggle();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(13),
                          child: isHiddenPassword
                              ? SvgPicture.asset('assets/icons/eye.svg')
                              : SvgPicture.asset('assets/icons/eye_hide.svg'),
                        ),
                      ),
                      labelText: "Пароль",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: w,
            height: 56,
            margin: EdgeInsets.only(
              left: 32,
              right: 32,
              bottom: Platform.isIOS ? 32 : 24,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isNext
                  ? Colors.purple
                  : Colors.black.withOpacity(0.2),
            ),
            child: Center(
              child: Text(
                'Войти',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isHiddenPassword = false;

  _toggle() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }


}
