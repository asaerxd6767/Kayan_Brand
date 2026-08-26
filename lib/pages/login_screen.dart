import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/core/utils/app_validators.dart';
import 'package:local_brand/pages/signup_screen.dart';
import 'package:local_brand/widgets/form_field.dart';

import '../core/routing/routes.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

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

              Form(
                key: _formKey,
              // ----------- Text fields
                child: Column(
                  spacing: KayanSpacing.md,
                  children: [
                    MyTextField(
                      hintText: 'Email',
                      validate: AppValidator.validateEmail,
                      controller: _emailcontroller,
                    ),
                    MyTextField(
                      hintText: 'Password',
                      validate: AppValidator.validatePassword,
                      controller: _passwordcontroller,
                      suffix: TextButton(
                        onPressed: () {},
                        child: Text('Forgot?'),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()) {
                            // TODO: Implement Auth here
                          if(!context.mounted) return;

                            Navigator.pushReplacementNamed(context, Routes.home);
                          }
                        },
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
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
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
