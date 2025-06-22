import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/products/widgets/color_picker.dart';
import 'package:crafty_bay/features/products/widgets/inc_dec_button.dart';
import 'package:crafty_bay/features/products/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product-details';
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Nike 1284HST - new shoe of 2025',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.6,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            IncDecButton(onChanged: (int value) {}),
                          ],
                        ),

                        Row(
                          children: [
                            Wrap(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                Text(
                                  '4.5',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Reviews'),
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

                        Text(
                          'Color',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        ColorPicker(
                          colors: ['Black', 'Blue', 'Red', 'Green', 'Yellow', 'Pink'],
                          onSelected: (String value) {},
                        ),
                        SizedBox(height: 16),

                        Text(
                          'Size',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        ColorPicker(
                          colors: ['S', 'M', 'L', 'XL', 'XXL',],
                          onSelected: (String value) {},
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildPriceAddToCartSection(),
        ],
      ),
    );
  }

  Widget buildPriceAddToCartSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.themeColor.withOpacity(0.15),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Price', style: Theme.of(context).textTheme.bodyLarge),
              Text(
                '${Constants.takaSign}100',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColor.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: () {}, child: Text('Add to Cart')),
          ),
        ],
      ),
    );
  }
}
