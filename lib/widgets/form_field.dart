import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Widget? suffix;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  final bool isPassword;

  const MyTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,  this.validate, this.suffix, this.controller, this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(),
        hintText: hintText,
        hintStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.outline),
        suffix: suffix,
      ),

      validator: validate,
    );
  }
}
