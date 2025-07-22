import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/common/models/category_model.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/products/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/features/products/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/features/reviews/ui/screens/reviews_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/ui/screens/splash_screen.dart';
import '../features/reviews/ui/screens/create_review_screen.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    late final Widget screenWidget;

    if (settings.name == SplashScreen.name) {
      screenWidget = SplashScreen();
    } else if (settings.name == LoginScreen.name) {
      screenWidget = LoginScreen();
    } else if (settings.name == SignUpScreen.name) {
      screenWidget = SignUpScreen();
    } else if (settings.name == MainBottomNavScreen.name) {
      screenWidget = MainBottomNavScreen();
    } else if (settings.name == ProductListScreen.name) {
      final CategoryModel category = settings.arguments as CategoryModel;
      screenWidget = ProductListScreen(category: category);
    } else if (settings.name == ProductDetailsScreen.name) {
      final String productId = settings.arguments as String;
      screenWidget = ProductDetailsScreen(productId: productId);
    } else if (settings.name == VerifyOtpScreen.name) {
      final String email = settings.arguments as String;
      screenWidget = VerifyOtpScreen(email: email);
    } else if (settings.name == ReviewsScreen.name) {
      screenWidget = ReviewsScreen();
    } else if (settings.name == CreateReviewScreen.name) {
      screenWidget = CreateReviewScreen();
    }
    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
