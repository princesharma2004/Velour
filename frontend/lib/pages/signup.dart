import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:velour/utils/validators.dart';
import 'package:velour/components/common/infobox.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _signupKey = GlobalKey<FormState>();
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 360,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.dividerColor.withOpacity(0.6),
              ),
            ),
            child: Form(
              key: _signupKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Velour',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Sign up to see matches you’ll love',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildField(
                    hint: 'Display name',
                    validator: validateDisplayName,
                  ),
                  _buildField(
                    hint: 'Username',
                    validator: validateUsername,
                  ),
                  _buildField(
                    hint: 'Email',
                    validator: validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildField(
                    hint: 'Password',
                    validator: validatePassword,
                    obscureText: true,
                    maxLength: 64,
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () {
                      if (_signupKey.currentState!.validate()) {
                        _logger.i('Form is valid.');
                        infoBox(
                          context,
                          'Success',
                          'Account created',
                        );
                      }
                    },
                    child: const Text('Sign up'),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'By signing up, you agree to our Terms, Privacy Policy and Cookies Policy.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 11,
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required String hint,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
    bool obscureText = false,
    int? maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLength: maxLength,
        validator: validator,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          counterText: '',
        ),
      ),
    );
  }
}
