import 'package:crafty_bay/features/common/models/category_model.dart';
import 'package:crafty_bay/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: categoryModel,
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.themeColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(categoryModel.iconUrl, height: 32, width: 32),
          ),
          SizedBox(height: 4),
          Text(
            _getTitle(categoryModel.title),
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColor.themeColor),
          ),
        ],
      ),
    );
  }

  String _getTitle(String title) {
    if (title.length > 9) {
      return '${title.substring(0, 6)}...';
    }
    return title;
  }
}
