import 'dart:async';
import 'package:get/get.dart';

import '../../../../app/app.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network/network_client.dart';
import '../screens/login_screen.dart';

class OtpController extends GetxController {
  bool isLoading = false;
  int otpValidity = 10;
  String? userEmail;
  Future<void> verifyOtp({required String email, required String otp}) async {
    isLoading = true;
    update();
    userEmail = email;
    Map<String, dynamic> responseBody = {"email": email, "otp": otp};
    String url = Urls.verifyOtpUrl;
    NetworkResponse response = await Get.find<NetworkClient>().postRequest(
      url: url,
      body: responseBody,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar(
        'Welcome to Crafty Bay',
        "Successfully verified email address",
      );
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        LoginScreen.name,
        (predicate) => false,
      );
    } else {
      Get.snackbar('Sorry can not verify', response.errorMessage!);
    }
    isLoading = false;
    update();
  }
  countOtp() async {
    Timer.periodic(Duration(seconds: 1), (time) {
      if (otpValidity > 0) {
        otpValidity--;
        update();
      } else {
        time.cancel();
        update();
      }
    });
  }
  resendOtp() {
    otpValidity = 120;
    update();
    countOtp();
    tryResendOtp();
  }
  Future<void> tryResendOtp() async {
    try {
      if (userEmail != null) {
        NetworkResponse response = await Get.find<NetworkClient>().postRequest(
          url: Urls.resendOtpUrl,
          body: {"email": userEmail},
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.snackbar('Your otp has been sent', 'Please check your email');
        } else {
          Get.snackbar('Sorry can not send', response.errorMessage!);
        }
      }
    } catch (e) {
      Get.snackbar('Wait a moment', e.toString());
    }
  }
}
