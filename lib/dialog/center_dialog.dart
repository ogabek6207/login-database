import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterDialog {
  static void showErrorDialog(
      BuildContext context,
      ) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("Login yoki parol xato"),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 44,
                  color: Colors.transparent,
                  child:  const Center(
                    child: Text("ok",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
  static void showErrorDialogName(
      BuildContext context,
      ) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("Ism yoki Familya xato"),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 44,
                  color: Colors.transparent,
                  child:  const Center(
                    child: Text("ok",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}