import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final String name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 44),
              AppLogo(width: 90, height: 90),
              Text('Welcome Back', style: textTheme.titleLarge),
              Text(
                'Please enter your email & password',
                style: textTheme.headlineMedium,
              ),
              SizedBox(height: 24),
              TextFormField(decoration: InputDecoration()),

              SizedBox(height: 8),
              TextFormField(decoration: InputDecoration()),
            ],
          ),
        ),
      ),
    );
  }
}
