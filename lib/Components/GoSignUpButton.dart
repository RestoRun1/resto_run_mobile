import 'package:flutter/material.dart';

class GoSignUpButton extends StatelessWidget {
  void click() {
    print("Go Sign Up Button Works");
  }

  const GoSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Don't have account ?",
          style: TextStyle(
            color: Color.fromRGBO(142, 176, 148, 1),
          ),
        ),
        TextButton(
            onPressed: () {
              print("s");
            },
            child: 
              Text("Sign Up",
                   style: TextStyle(
                    color: Color.fromRGBO(142, 176, 148, 1),
                   ), 
            )),
      ],
    );
  }
}
