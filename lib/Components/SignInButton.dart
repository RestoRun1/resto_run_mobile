import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final String text;

  const SignInButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:  MaterialStateProperty.all<Color>(Color.fromRGBO(142, 176, 148, 1))
              
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/mainPage');
            },
            child:  Text(
              text,
              style: const TextStyle(
                color: Colors.white
              ),
            ),
          )),
    );
  }
}
