import 'package:flutter/material.dart';
import 'package:login/ui/auth/forgot_password_screen.dart';
import 'package:login/ui/login_screen.dart';
import 'package:login/ui/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(

      ),
    );
  }
}
