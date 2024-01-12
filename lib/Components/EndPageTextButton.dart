import 'package:flutter/material.dart';

class EndPageTextButton extends StatelessWidget {
  final String description;
  final String buttonText;
  final Function touchButton;

  const EndPageTextButton(
      {super.key,
      required this.description,
      required this.buttonText,
      required this.touchButton});

  void click() {
    print("Go Sign Up Button Works");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          description,
          style: TextStyle(
            color: Color.fromRGBO(142, 176, 148, 1),
          ),
        ),
        TextButton(
            onPressed: () {
              touchButton(context);
            },
            child: Text(
              buttonText,
              style: TextStyle(
                color: Color.fromRGBO(142, 176, 148, 1),
              ),
            )),
      ],
    );
  }
}
