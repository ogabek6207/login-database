import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login/ui/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Column(
              children: [
                // Start Logo Container
                Container(
                  margin: const EdgeInsets.only(top: 112),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lightBlueAccent,
                  ),
                ),
                // End Logo Container

                // Start Text Container
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: const Text(
                    'Let’s Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                // End Text Container

                // Start Bio Container
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: const Text(
                    'Create an new account',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                // End Bio Container

                // Start Input Email Conatiner
                Container(
                  margin: const EdgeInsets.only(top: 28, left: 16, right: 16),
                  width: w,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFEBF0FF),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      SvgPicture.asset("assets/icons/User.svg"),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: TextField(
                          controller: namecontroller,
                          decoration: const InputDecoration(
                            hintText: "Full Name",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // End Input Email Conatiner

                // Start Input Password Conatiner

                Container(
                  margin: const EdgeInsets.only(top: 28, left: 16, right: 16),
                  width: w,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFEBF0FF),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      SvgPicture.asset("assets/icons/Password.svg"),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: TextField(
                          controller: passwordcontroller,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // End Input Password Conatiner

                // Start Input Password Conatiner

                GestureDetector(
                  onTap: () {
                    _getData();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 28, left: 16, right: 16),
                    width: w,
                    height: 57,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Sig in',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
                // End Input Sig nn Conatiner
              ],
            ),
          ),
          const SizedBox(
            height: 31,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                width: 134,
                height: 1,
                color: const Color(0xFFEBF0FF),
              ),
              const Spacer(),
              const Text(
                'OR',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9098B1),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(right: 16),
                width: 134,
                height: 1,
                color: const Color(0xFFEBF0FF),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Forgot Password?',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF40BFFF)),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RegisterScreen();
                  },
                ),
              );
            },
            child: const Text(
              'Don\'t have a account? Register',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  _getData() async {}
}
