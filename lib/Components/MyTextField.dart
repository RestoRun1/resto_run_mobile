import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder:
                // ignore: prefer_const_constructors
                OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(142, 176, 148, 1)),
                    borderRadius: BorderRadius.circular(25)),
            focusedBorder:
                // ignore: prefer_const_constructors
                OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(142, 176, 148, 1)),
                    borderRadius: BorderRadius.circular(50)),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: icon),
      ),
    );
  }
}
