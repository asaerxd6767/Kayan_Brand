import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_color.dart';

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
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodyMedium?.copyWith(color: KayanColors.outline),
      ),
    );
  }
}
