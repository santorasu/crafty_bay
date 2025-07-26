import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/assets_path.dart';
class AppLogo extends StatelessWidget {
   const AppLogo({super.key,  this.height,  this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsPath.appLogoSvg,
      height: height ,
      width: width ?? 120,
    );
  }
}