import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;

  static final String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(height: 44),
                  AppLogo(width: 90, height: 90),
                  SizedBox(height: 16),
                  Text('Verify OTP', style: textTheme.titleLarge),
                  SizedBox(height: 4),
                  Text(
                    'Please enter your 4 digits OTP sent to your ${widget.email}',
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium,
                  ),
                  SizedBox(height: 24),
                  PinCodeTextField(
                    controller: _otpController,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 300),
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    appContext: context,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onTapLoginButton,
                    child: Text('Verify'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLoginButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
    // if (_formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
