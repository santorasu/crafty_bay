import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/app_colors.dart';
import '../../../app/assets_path.dart';
import '../../auth/ui/controller/main_bottom_nav_controller.dart';
import '../../products/controller/prodct_quantity_controller.dart';
import '../controller/get_cart_product_controller.dart';
import '../widgets/build_price_and_checkout_section.dart';
import '../widgets/inc_dec_section.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  MainBottomNavController mainBottomNavController =
      Get.find<MainBottomNavController>();
  ProductQuantityController productQuantityController =
      Get.find<ProductQuantityController>();
  GetCartProductController getCartProductController =
      Get.find<GetCartProductController>();

  @override
  void initState() {
    super.initState();
    fetchCartProduct();
  }

  fetchCartProduct() async {
    await Get.find<GetCartProductController>().getCartProduct();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        mainBottomNavController.backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
            onPressed: () {
              mainBottomNavController.backToHome();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder<GetCartProductController>(
          builder: (controller) {
            return Visibility(
              visible: controller.isLoading == false,
              replacement: CenteredCircularProgressIndicator(),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.cartProductList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller
                                        .cartProductList[index]
                                        .productModel
                                        .productImage
                                        .isNotEmpty
                                    ? Image.network(
                                      controller
                                          .cartProductList[index]
                                          .productModel
                                          .productImage
                                          .first,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    )
                                    : Image.asset(
                                      AssetsPath.productImagePng,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    spacing: 20,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                //title
                                                '${controller.cartProductList[index].productModel.productTitle.substring(0, controller.cartProductList[index].productModel.productTitle.length < 16 ? controller.cartProductList[index].productModel.productTitle.length : 16)}..',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Row(
                                                children: [
                                                  controller
                                                              .cartProductList[index]
                                                              .color !=
                                                          null
                                                      ? Text(
                                                        'Color: ${controller.cartProductList[index].color}  ',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                      : SizedBox.shrink(),
                                                  controller
                                                              .cartProductList[index]
                                                              .size !=
                                                          null
                                                      ? Text(
                                                        'Color: ${controller.cartProductList[index].size}',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                      : SizedBox.shrink(),
                                                ],
                                              ),
                                            ],
                                          ),
                                          IconButton(onPressed:()=> onPressedDeleteCartItem(index), icon: Icon(Icons.delete)),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              //price
                                              "${controller.cartProductList[index].quantity * controller.cartProductList[index].productModel.productPrice}",
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: AppColors.themColor,
                                              ),
                                            ),
                                          ),
                                          GetBuilder<ProductQuantityController>(
                                            builder: (controller) {
                                              return IncDecSection(
                                                index,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  buildPriceAndCheckoutSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }




  onPressedDeleteCartItem(index){
    Get.find<GetCartProductController>().deleteCartItem(index);
  }
}
