import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../app/app_colors.dart';
import '../../../common/loading_widgets/loading_widget.dart';
import '../controller/otp_controller.dart';
import '../widgets/logo_header.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  final String email;

  static final name = 'otpVerification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  OtpController otpController = Get.find<OtpController>();

  @override
  void initState() {
    super.initState();
    otpController.countOtp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 5.5),
                LogoHeader(
                  titleLarge: 'Enter otp code',
                  titleSmall: 'A 4 digit code has been sent',
                ),
                const SizedBox(height: 20),

                Form(
                  key: _formKey,
                  child: PinCodeTextField(
                    validator: (value) {
                      if (_otpTEController.text.length < 4) {
                        return '';
                      }
                      return null;
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    length: 4,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    showCursor: false,
                    animationType: AnimationType.fade,
                    autoUnfocus: false,
                    pinTheme: PinTheme(
                      activeColor: AppColors.themColor,
                      selectedFillColor: AppColors.themColor.shade200,
                      inactiveColor: AppColors.themColor,
                      inactiveFillColor: Colors.white,
                      errorBorderColor: Colors.red,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: _otpTEController,
                    onCompleted: (v) {},
                    appContext: context,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _onTapSubmitOtp,
                  child: GetBuilder<OtpController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.isLoading == false,
                        replacement: LoadingWidget.forButton(),
                        child: Text('Next'),
                      );
                    },
                  ),
                ),

                GetBuilder<OtpController>(
                  builder: (controller) {
                    return Column(
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          controller.otpValidity > 0
                              ? 'This code will expired in ${controller.otpValidity} seconds'
                              : 'Otp expired',
                          style: TextStyle(fontSize: 15),
                        ),

                        const SizedBox(height: 20),
                        controller.otpValidity <= 0
                            ? GestureDetector(
                                onTap: () {
                                  controller.resendOtp();
                                },
                                child: Text(
                                  'Resend Otp',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.themColor,
                                  ),
                                ),
                              )
                            : Text(
                                'Resend Otp',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onTapSubmitOtp() {
    if (_formKey.currentState!.validate()) {
      Get.find<OtpController>().verifyOtp(
        email: widget.email,
        otp: _otpTEController.text,
      );
    }
  }
}
