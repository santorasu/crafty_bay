import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        'Nike 1284HST - new shoe of 2025',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
          color: Colors.black54,
        ),
      ),
    );
  }
}