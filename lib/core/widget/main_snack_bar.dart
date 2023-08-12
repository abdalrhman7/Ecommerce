import 'package:flutter/material.dart';

void mainSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    backgroundColor: Colors.red,
    content: Text('Item Added'),
    duration: Duration(milliseconds: 700),
  ));
}
