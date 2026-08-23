import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_color.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/core/theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                      color: KayanColors.outline,
                    ),
                  ),
                ],
              ),

              // Text fields
              Form(
                child: Column(
                  spacing: KayanSpacing.md,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Email or Phone'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffix: TextButton(
                          onPressed: () {},
                          child: Text("Forgot?"),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: KayanColors.primary,
                        ),
                        onPressed: () {},
                        child: Text(
                          'LOGIN',
                          style: textTheme.bodyLarge?.copyWith(
                            color: KayanColors.onPrimary,
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: textTheme.bodyMedium?.copyWith(
                            color: KayanColors.outline
                          ),
                        ),
                        TextButton(onPressed: () {}, child: Text('Sign Up', style: textTheme.bodyMedium,)),
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
