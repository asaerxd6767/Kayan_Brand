import 'package:flutter/material.dart';
import 'package:local_brand/core/utils/extenstions/capitalized.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Widget? suffix;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final int? maxLines;

  final bool isPassword;

  const MyTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,  this.validate, this.suffix, this.controller, this.prefixIcon, this.maxLines,
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
        hintText: hintText.toCapitalized(),
        hintStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.outline),
        suffix: suffix,
      ),
      maxLines: maxLines,
      validator: validate,
    );
  }
}
