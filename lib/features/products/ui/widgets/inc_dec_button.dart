import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_colors.dart';
import '../../controller/prodct_quantity_controller.dart';
import '../../controller/product_details_controller.dart';

class IncDecButton extends StatelessWidget {
  const IncDecButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                controller.productData?.title ?? '',
                style: TextStyle(overflow: TextOverflow.visible),
              ),
            ),
            GetBuilder<ProductQuantityController>(
              builder: (context) {
                return increaseDecreaseSection();
              },
            ),
          ],
        );
      },
    );
  }

  Widget increaseDecreaseSection() {
    return Row(
      children: [
        IconButton(
          onPressed: decrement,
          icon: Icon(Icons.indeterminate_check_box, color: AppColors.themColor),
        ),
        Text('${ProductQuantityController.Controller.quantity}'),
        IconButton(
          onPressed: increment,
          icon: Icon(Icons.add_box, color: buttonColor()),
        ),
      ],
    );
  }

  buttonColor() {
    return AppColors.themColor;
  }
  increment() {
    if (ProductQuantityController.Controller.quantity > 19) return;
    ProductQuantityController.Controller.increaseQuantity();
  }
  decrement() {
    if (ProductQuantityController.Controller.quantity < 2) return;
    ProductQuantityController.Controller.dicreaseQuantity();
  }
}
