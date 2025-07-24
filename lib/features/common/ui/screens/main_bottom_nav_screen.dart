import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../auth/ui/controller/auth_controller.dart';
import '../../../auth/ui/controller/main_bottom_nav_controller.dart';
import '../../../cert/screens/cart_checkout_screen.dart';
import '../../../home/controller/home_slider_controller.dart';
import '../../../home/ui/screens/home_screen.dart';
import '../../../products/controller/new_prduct_controller.dart';
import '../../../products/controller/popular_product_controller.dart';
import '../../../products/controller/product_ catagory_controller.dart';
import '../../../products/controller/special_product_controller.dart';
import '../../../products/ui/screens/product_catagory_screen.dart';
import '../../../wish_list/ui/screens/wish_list_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static String name = 'main_bottom_nav';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}
class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   initializeAllData();
  }

  initializeAllData() {
   return  WidgetsBinding.instance.addPostFrameCallback((_){
      AuthController.getUserInformation();
      Get.find<HomeSliderController>().getSlider();
      Get.find<ProductCategoryController>().getCategoryList();
      Get.find<PopularProductController>().getPopularProduct();
      Get.find<SpecialProductController>().getSpecialProduct();
       Get.find<NewProductController>().getNewProduct();
    });
  }



  List<Widget> screens = [
    HomeScreen(),
    ProductCategoryScreen(),
    CartCheckOutScreen(),
    WishListScreen(),
  ];

  MainBottomNavController mainBottomNavController =
      Get.find<MainBottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BuildBottomNav(),
      body: GetBuilder<MainBottomNavController>(
        builder: (controller) {
          return screens[controller.selectedIndex];
        }
      ),
    );
  }
}


class BuildBottomNav extends StatelessWidget {
  const BuildBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return NavigationBar(
          selectedIndex: controller.selectedIndex,
          onDestinationSelected: (int index) {
            controller.changeScreen(index);
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'home'),
            NavigationDestination(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outlined),
              label: 'Wish',
            ),
          ],
        );
      },
    );
  }
}
