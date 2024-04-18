import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconData {
  static const String _basePath = 'assets/svgs/';
  static const String google = '${_basePath}google.svg';
  static const String github = '${_basePath}github.svg';
  static const String delivery = '${_basePath}delivery.svg';
  static const String bus = '${_basePath}bus.svg';
  static const String check = '${_basePath}check.svg';
  static const String user = '${_basePath}user.svg';
  static const String empty = '${_basePath}empty.svg';
}

class AppIcons extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;
  final double size;
  final Color? color;
  const AppIcons({
    super.key,
    this.onPressed,
    required this.icon,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SvgPicture.asset(
        icon,
        height: size,
        width: size,
        color: color,
      ),
    );
  }
}
