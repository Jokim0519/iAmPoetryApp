import 'package:flutter/material.dart';
import '../constants.dart';

Widget inputFile({label, obscureText = false}) {
  String UserEmail;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hoverColor: kMainColor,
          focusColor: kMainColor,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
