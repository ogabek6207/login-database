import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterDialog {
  static void showErrorDialog(
    BuildContext context,
    String msg,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Text(msg),
          title: const Text("Xatolik"),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 44,
                color: Colors.transparent,
                child: const Center(
                  child: Text(
                    "ok",
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
      },
    );
  }
}
