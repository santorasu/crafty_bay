import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../app/app.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network/network_client.dart';
import '../../data/models/registration_request_model.dart';
import '../screens/otp_verification_screen.dart';

class RegistrationController extends GetxController {
  bool _isLoading = false;
  get isLoading => _isLoading;


  Future<bool>registration(RegistrationRequestModel body)async{
    _isLoading = true;
    update();

    String url = Urls.registrationUrl;

    bool isSuccess = false;
    Logger().e('''
    => ${body.toJson()}
    ''');

    NetworkResponse response = await Get.find<NetworkClient>().postRequest(url: url, body: body.toJson());

    if(response.statusCode == 200 || response.statusCode == 201){
      isSuccess = true;
      navigatorKey.currentState?.pushNamed(OtpVerificationScreen.name, arguments: body.email);
    }else{
     if(response.errorMessage != null){
       Get.snackbar('Sorry..!', response.errorMessage!);
     }
    }
    _isLoading = false;
    update();
    return isSuccess;
  }


}