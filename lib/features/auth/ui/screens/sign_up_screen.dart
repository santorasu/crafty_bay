import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static final String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  AppLogo(width: 90, height: 90),
                  SizedBox(height: 16),
                  Text('Register Account', style: textTheme.titleLarge),
                  SizedBox(height: 4),
                  Text(
                    'Please enter your details to sign up',
                    style: textTheme.headlineMedium,
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "Email"),
                    validator: (String? value) {
                      String emailValue = value ?? '';
                      if (EmailValidator.validate(emailValue) == false) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 8),
                  TextFormField(
                    controller: _firstNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "First Name"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid First Name';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "Last Name"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid Last Name';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 8),
                  TextFormField(
                    controller: _mobileController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "Mobile Number"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid Mobile Number';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "Password"),

                    validator: (String? value) {
                      if ((value?.length ?? 0) <= 6) {
                        return 'Enter a password more than 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _cityController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "City"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a City Name';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 8),
                  TextFormField(
                    controller: _addressController,
                    textInputAction: TextInputAction.done,
                    maxLines: 3,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      hintText: "Shipping Address",
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a Shipping Address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onTapLoginButton,
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLoginButton() {
    if (_formKey.currentState!.validate()) {}
  }
}
