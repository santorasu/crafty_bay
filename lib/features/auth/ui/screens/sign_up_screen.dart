import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/sign_up_request_model.dart';
import '../controller/registration_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static final name = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Text('Register Account', style: textTheme.titleLarge),
                  SizedBox(height: 4),
                  Text(
                    'Please enter your details to sign up',
                    style: textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
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

                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _onTapSignup,
                    child: GetBuilder<RegistrationController>(
                      builder: (controller) {
                        return Visibility(
                            visible: Get.find<RegistrationController>().isLoading == false,
                            replacement: CenteredCircularProgressIndicator(),
                            child: Text('SignUp'));
                      }
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

  _onTapSignup() async {
    var registrationInfo = RegistrationRequestModel(
      email: _emailController.text.trim(),
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      password: _lastNameController.text,
      city: _shippingAddressTEController.text.trim(),
      mobile: _mobileController.text.trim(),
    );
    if (_formKey.currentState!.validate()) {
       await Get.find<RegistrationController>().registration(registrationInfo);

    }
  }


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _shippingAddressTEController.dispose();
  }
}
