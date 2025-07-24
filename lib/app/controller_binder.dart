import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/service/network/network_client.dart';
import '../features/auth/ui/controller/auth_controller.dart';
import '../features/auth/ui/controller/login_controller.dart';
import '../features/auth/ui/controller/main_bottom_nav_controller.dart';
import '../features/auth/ui/controller/otp_controller.dart';
import '../features/auth/ui/controller/registration_controller.dart';
import '../features/auth/ui/screens/login_screen.dart';
import '../features/cert/controller/get_cart_product_controller.dart';
import '../features/checkout/data/model/place_order_controller.dart';
import '../features/home/controller/home_slider_controller.dart';
import '../features/products/controller/add_cart_controller.dart';
import '../features/products/controller/color_controller.dart';
import '../features/products/controller/create_review_controller.dart';
import '../features/products/controller/current_slide_indicator_controller.dart';
import '../features/products/controller/new_prduct_controller.dart';
import '../features/products/controller/popular_product_controller.dart';
import '../features/products/controller/prodct_quantity_controller.dart';
import '../features/products/controller/product_ catagory_controller.dart';
import '../features/products/controller/product_details_controller.dart';
import '../features/products/controller/product_list_by_category_controller.dart';
import '../features/products/controller/product_review_controller.dart';
import '../features/products/controller/product_size_controller.dart';
import '../features/products/controller/special_product_controller.dart';
import '../features/wish_list/controller/add_to_wish_list_controller.dart';
import '../features/wish_list/controller/wish_list_controller.dart';
import 'app.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(
      NetworkClient(
        onSocketException: onSocketException,
        onUnAuthorize: _onUnAuth,
        commonHeader: commonHeader,
      ),
    );
    Get.put(MainBottomNavController());
    Get.put(CurrentSlideIndicatorController());
    Get.put(ProductQuantityController());
    Get.put(ColorController());
    Get.put(ProductSizeController());
    Get.put(RegistrationController());
    Get.put(OtpController());
    Get.put(LoginController());
    Get.put(HomeSliderController());
    Get.put(ProductCategoryController());
    Get.put(ProductListByCategoryController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(ProductReviewController());
    Get.put(GetCartProductController(), permanent: true);
    Get.put(CreateReviewController());
    Get.put(WishListController());
    Get.put(AddToWishListController());
    //Get.put(PaymentController());
    Get.put(PlaceOrderController());
  }
}

Map<String, String> commonHeader() {
  String? token = Get.find<AuthController>().token;

  Map<String, String> commonHeader = {
    "Content-Type": "application/json",
    "token": token ?? '',
  };

  return commonHeader;
}

Future<void> _onUnAuth() async {
  Navigator.pushNamedAndRemoveUntil(
    navigatorKey.currentContext!,
    LoginScreen.name,
    (predicate) => false,
  );
  await Get.find<AuthController>().logOut();
}

onSocketException() {
   Get.snackbar(
    'Sorry..!',
    'Please check your internet connection and try again later',
  );
}
