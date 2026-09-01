import 'package:flutter/material.dart';
import 'package:local_brand/api/auth_service.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/core/utils/app_validators.dart';
import 'package:local_brand/core/utils/extenstions/capitalized.dart';
import 'package:local_brand/pages/login_screen.dart';
import '../widgets/form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _key = GlobalKey<FormState>();
  final _auth = AuthService.instance;
  bool _isLoading = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  Future<void> _signUp() async {
    if (!_key.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final credential = await _auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      await credential.user?.updateDisplayName(_nameController.text.trim());
      // No manual navigation: the auth stream in main.dart sends us to Home.
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    final List<String> sizes = ['xs', 's', 'm', 'l', 'xl'];

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(KayanSpacing.lg),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 460),
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
                'create account'.toCapitalized(),
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
                key: _key,
                child: Column(
                  spacing: KayanSpacing.md,
                  crossAxisAlignment: .stretch,
                  children: [
                    MyTextField(
                      hintText: 'Full name',
                      validate: AppValidator.validateName,
                      controller: _nameController,
                    ),
                    MyTextField(
                      hintText: 'Email Address',
                      validate: AppValidator.validateEmail,
                      controller: _emailController,
                    ),
                    MyTextField(
                      hintText: 'Phone Number',
                      validate: AppValidator.validatePhone,
                      controller: _phoneController,
                    ),
                    MyTextField(
                      hintText: 'Password',
                      isPassword: true,
                      validate: AppValidator.validatePassword,
                      controller: _passwordController,
                    ),
                    MyTextField(
                      hintText: 'Confirm Password',
                      isPassword: true,
                      validate: (value) => AppValidator.validateConfirmPassword(
                        value,
                        _passwordController.text,
                      ),
                      controller: _confirmpasswordController,
                    ),

                    Text(
                      'Size Preference (Optional)',
                      style: textTheme.bodySmall,
                    ),
                    SingleChildScrollView(
                      scrollDirection: .horizontal,
                      child: Row(
                        spacing: KayanSpacing.sm,
                        children: sizes
                            .map(
                              (e) => OutlinedButton(
                                onPressed: () {},
                                child: Text(e.toUpperCase()),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _signUp,
                      child: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text('SIGN UP'),
                    ),

                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: textTheme.bodySmall,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text('Login', style: textTheme.labelLarge),
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
      ),
    );
  }
}
