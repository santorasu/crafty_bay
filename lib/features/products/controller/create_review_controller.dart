import 'package:get/get.dart';

import '../../../app/urls.dart';
import '../../../core/service/network/network_client.dart';

class CreateReviewController extends GetxController{
  bool isLoading = false;
  int rating = 0;
  int selectedIndex = 0;

  Future<bool> createReview(Map<String,dynamic> body)async{
    isLoading = true;
    update();
    
    NetworkResponse response = await Get.find<NetworkClient>().postRequest(url: Urls.createReviewUrl, body: body);

    if(response.statusCode == 200 || response.statusCode == 201){
      isLoading = false;
      selectedIndex = 0;
      update();
      return true;
    }else{
      isLoading = false;
      update();
      return false;
    }
  }

  ratingHandler(index){
    rating = index+1;
    selectedIndex = index;
    update();
  }
}