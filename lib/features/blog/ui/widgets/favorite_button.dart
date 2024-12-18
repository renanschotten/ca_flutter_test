import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.initialValue,
    required this.onTap,
  });

  final bool initialValue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        initialValue ? Icons.star : Icons.star_border,
        color: initialValue ? Colors.amberAccent : null,
      ),
    );
  }
}
