import 'package:flutter/material.dart';

class FailurePage extends StatelessWidget {
  const FailurePage({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onTapButton,
  });

  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onTapButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.0,
        children: [
          Text(
            title,
            style: TextTheme.of(context).titleLarge,
          ),
          Text(
            description,
            style: TextTheme.of(context).bodyLarge,
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              onPressed: onTapButton,
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
