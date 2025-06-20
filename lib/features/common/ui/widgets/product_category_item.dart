import 'package:crafty_bay/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Computer');
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.themeColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.computer,
              color: AppColor.themeColor,
              size: 32,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Computers',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColor.themeColor),
          ),
        ],
      ),
    );
  }
}