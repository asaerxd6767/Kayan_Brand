import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            spacing: KayanSpacing.lg,
            children: [
              // Kayan logo
              Text('KAYAN', style: textTheme.headlineLarge),

              // Welcome back
              Column(
                spacing: KayanSpacing.md,
                crossAxisAlignment: .start,
                children: [
                  Text('Welcome Back', style: textTheme.headlineLarge),
                  Text(
                    'Enter your details to access your curated collection.',
                    style: textTheme.headlineSmall?.copyWith(
                      color: colorTheme.outline,
                    ),
                  ),
                ],
              ),

              // ----------- Text fields
              Form(
                child: Column(
                  spacing: KayanSpacing.md,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email or Phone',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        suffix: TextButton(
                          onPressed: () {},
                          child: Text("Forgot?"),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('LOGIN'),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorTheme.outline,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Sign Up', style: textTheme.bodyMedium),
                        ),
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
