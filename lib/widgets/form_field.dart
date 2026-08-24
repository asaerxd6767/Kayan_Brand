import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;

  const MyTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        hintStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.outline),
      ),
    );
  }
}
