import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/asset_paths.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetPaths.logoSvg,
      width: width ?? 100,
      height: height,
    );
  }
}
