import 'package:flutter/material.dart';

void mainSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    backgroundColor: Colors.red,
    content: Text(title),
    duration: const Duration(milliseconds: 700),
  ));
}
