import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/app_colors.dart';
import '../controller/get_cart_product_controller.dart';

Widget IncDecSection(int index) {
  return GetBuilder<GetCartProductController>(
    builder: (controller) {
      return Row(
        children: [
          IconButton(
            onPressed: () {
              controller.dicreaseQuantityFromQty(index);
            },
            icon: Icon(
              Icons.indeterminate_check_box,
              color: AppColors.themColor,
            ),
          ),
          Text(
            '${Get.find<GetCartProductController>().cartProductList[index].quantity}',
          ),
          IconButton(
            onPressed: () {
              controller.increaseQuantityFromQty(index);
            },
            icon: Icon(Icons.add_box, color: AppColors.themColor),
          ),
        ],
      );
    },
  );
}