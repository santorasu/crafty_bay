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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            SizedBox(height: 44,),
            AppLogo(width: 90, height: 90),
            Text('Welcome Back',style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: .4,
            ),),
            Text('Please enter your email & password',style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),),

          ]),
        ),
      ),
    );
  }
}
