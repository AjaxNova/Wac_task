import 'package:flutter/material.dart';

const Color appbarColor = Color(0xFF92C848);
void showErrorDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Something Went Wrong'),
        content: const Text('check your network and  Please restart the app'),
        actions: [
          TextButton(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
