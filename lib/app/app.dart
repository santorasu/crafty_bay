import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../features/auth/ui/screens/splash_screen.dart';
import 'app_routes.dart';
import 'app_theme.dart';
import 'controller_binder.dart';


class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      initialBinding: ControllerBinder(),
      theme: AppTheme.lightThemeData,
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

