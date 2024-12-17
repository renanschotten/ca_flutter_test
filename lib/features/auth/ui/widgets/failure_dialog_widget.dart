import 'package:flutter/material.dart';

class FailureDialogWidget extends StatelessWidget {
  const FailureDialogWidget({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onTap,
    this.description = '',
  });

  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: onTap,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
