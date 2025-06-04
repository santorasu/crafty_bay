import 'package:flutter/material.dart';

import '../features/auth/ui/screens/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings){
    late final Widget screenWidget;

    if (settings.name == SplashScreen.name) {
      screenWidget = SplashScreen();
    }

    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}