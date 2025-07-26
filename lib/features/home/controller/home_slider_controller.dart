import 'package:get/get.dart';

import '../../../app/urls.dart';
import '../../../core/service/network/network_client.dart';
import '../data/model/home_slider_model.dart';

class HomeSliderController extends GetxController {
  bool isLoading = false;
  List<HomeSliderModel> homeSliderList= [];

  Future<void> getSlider ()async{
    isLoading = true;
    update();

    NetworkResponse response = await Get.find<NetworkClient>().getRequest(url: Urls.homeSliderUrl);

    if(response.statusCode == 200 || response.statusCode == 201){
      List sliderList = response.responseBody!['data']['results'];
      homeSliderList.clear();
      for(var data in sliderList){
        homeSliderList.add(HomeSliderModel.fromJson(data));
      }
    }
    isLoading = false;
    update();


  }
}