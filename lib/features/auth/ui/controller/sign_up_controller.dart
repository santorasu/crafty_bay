import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_request_model.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  late String _message;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  String get message => _message;

  Future<bool> signUp(SignUpRequestModel model) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.signUpUrl, body: model.toJson());
    if (response.isSuccess) {
      _message = response.responseData!['msg'];
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
