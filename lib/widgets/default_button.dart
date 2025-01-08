import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  VoidCallback onPressed;
  String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 56),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
