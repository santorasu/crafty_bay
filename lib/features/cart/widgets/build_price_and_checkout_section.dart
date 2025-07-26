import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../app/app_colors.dart';
import '../controller/get_cart_product_controller.dart';

Widget buildPriceAndCheckoutSection() {
  return Container(
    padding: EdgeInsets.all(10),
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(10),
        topLeft: Radius.circular(10),
      ),
      color: AppColors.themColor.shade50,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total price', style: TextStyle(fontSize: 13)),
            GetBuilder<GetCartProductController>(
              builder: (controller) {
                return Text(
                  '৳${controller.totalPrice}',
                  style: TextStyle(fontSize: 25, color: AppColors.themColor),
                );
              },
            ),
          ],
        ),
        SizedBox(
          width: 120,
          child: ElevatedButton(onPressed: () {}, child: Text('Checkout')),
        ),
      ],
    ),
  );
}
