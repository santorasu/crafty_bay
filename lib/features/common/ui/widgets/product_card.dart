import 'package:crafty_bay/features/products/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.name,
          arguments: '123',
        );
      },
      child: Container(
        width: 140,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.themeColor.withOpacity(0.2),
              offset: Offset(0.0, 0.7),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 140,
              decoration: BoxDecoration(
                color: AppColor.themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Image.asset(
                AssetPaths.dummyNikeShoePng,
                height: 80,
                width: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Nike ER34ST - New model of 2025',
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${Constants.takaSign}100',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColor.themeColor,
                        ),
                      ),
                      Wrap(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Text('4.5', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Card(
                        color: AppColor.themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.favorite_outline_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
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
  }
}
