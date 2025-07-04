import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/ui/controller/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(
      NetworkClient(
        onUnAuthorize: _onUnAuthorize,
        commonHeaders: _commonHeaders,
      ),
    );
    Get.put(SignUpController());
    Get.put(VerifyOtpController());
  }

  void _onUnAuthorize() {
    //TODO: logout from app and re-login
  }

  final  Map<String, String> _commonHeaders = {
    'content-type': 'application/json',
    'token': '',
  };
}
