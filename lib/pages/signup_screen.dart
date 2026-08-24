import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import '../widgets/form_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    final List<String> sizes = [
      'XS',
      'S',
      'M',
      'L',
      'XL'
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: colorTheme.onPrimary,
          ),
          child: Column(
            spacing: KayanSpacing.md,
            children: [
              // Headline
              Text(
                'Create Account',
                style: textTheme.headlineLarge?.copyWith(
                  color: colorTheme.primary,
                ),
              ),
              Text(
                'Join the KAYAN community for a curated fashion experience.',
                textAlign: .center,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorTheme.onSurfaceVariant,
                ),
              ),

              // Form
              Form(
                child: Column(
                  spacing: KayanSpacing.md,
                  crossAxisAlignment: .stretch,
                  children: [
                    MyTextField(hintText: 'Full name'),
                    MyTextField(hintText: 'Email Address'),
                    MyTextField(hintText: 'Phone Number'),
                    MyTextField(hintText: 'Password', isPassword: true),
                    MyTextField(hintText: 'Confirm Password', isPassword: true),

                    Text('Size Preference (Optional)', style: textTheme.bodySmall,),
                    SingleChildScrollView(
                      scrollDirection: .horizontal,
                      child: Row(
                        spacing: KayanSpacing.sm,
                        children:
                      sizes.map((e) => OutlinedButton(onPressed: () {}, child: Text(e)),).toList(),
                      ),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('SIGN UP')),

                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text('Already have an account?', style: textTheme.bodySmall,),
                        TextButton(onPressed: () {}, child: Text('Login', style: textTheme.labelLarge,))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
