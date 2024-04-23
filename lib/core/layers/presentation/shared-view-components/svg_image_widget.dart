import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImageWidget extends StatelessWidget implements PreferredSize {
  final String imagePath;
  final double preferredHeight;
  final double preferredWidth;
  final BoxFit imageFit;
  final Color color;
  const SvgImageWidget({super.key, required this.imagePath, this.preferredHeight = 24.0, this.preferredWidth = 24.0, this.imageFit = BoxFit.contain, this.color = Colors.black,});

  @override Widget build(BuildContext context,) => child;
  @override Widget get child => SvgPicture.asset(
    imagePath,
    fit: imageFit,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn,),
    height: preferredHeight,
    width: preferredWidth,
  );
  @override Size get preferredSize => Size(preferredWidth, preferredHeight,);
}
