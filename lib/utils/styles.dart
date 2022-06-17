import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static const textbutton = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );
  static final boxstyle = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.deepPurpleAccent,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        spreadRadius: 6.0,
        blurRadius: 6,
      ),
    ],
  );
}
