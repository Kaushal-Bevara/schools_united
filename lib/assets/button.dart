import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const Button({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {
          onTap;
        },
        style: const ButtonStyle(),
        child: Text(text),
      ),
    );
  }
}
