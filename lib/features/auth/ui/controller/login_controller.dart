import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../app/app.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network/network_client.dart';
import '../../../common/ui/screens/main_bottom_nav_screen.dart';
import '../../data/models/login_request_model.dart';
import 'auth_controller.dart';

class LoginController extends GetxController{
  bool isLoading = false ;

  Future<void>login ({required String email, required String password} )async{
    isLoading = true;
    update();

    final String url = Urls.loginUrls;
    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password
    };
    NetworkResponse response = await Get.find<NetworkClient>().postRequest(url: url, body: requestBody);

    if(response.statusCode == 200 || response.statusCode == 201){
      LoginModel information = LoginModel.fromJson(response.responseBody!);

     await AuthController.saveUserInformation(userToken: information.userData.token, user: information.userData.user.toJson());
     await AuthController.getUserInformation();


      Logger().i('''
      =>>   ${information.message}
      =>>   ${information.userData.token}
      =>>   ${information.userData.user.firstName}
      ''');

      navigatorKey.currentState?.pushNamedAndRemoveUntil(MainBottomNavScreen.name, (predicate)=>false);
    }else {
      Get.snackbar('Sorry', response.errorMessage!);
    }

    isLoading = false;
    update();
  }

}