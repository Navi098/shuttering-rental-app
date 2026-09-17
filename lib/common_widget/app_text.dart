import 'package:flutter/material.dart';

enum AppTextStyle{
  manropeExtraLight,
  manropeLight,
  manropeRegular,
  manropeMedium,
  manropeSemiBold,
  manropeBold,
  manropeExtraBold,
  bold,
  medium,
  regular,
  semibold,
  light,
}

class AppText extends StatelessWidget {
  final String text;
  final dynamic color;
  final AppTextStyle? style;
  final dynamic textSize;
  final int? maxlines;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? size;
  final String? fontFamily;
  const AppText({
    required this.text,
    this.fontWeight,
    this.fontStyle,
    this.textAlign,
    this.style,
    this.color,
    this.maxlines,
    this.textSize,
    this.size,
    this.fontFamily,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: (size ?? textSize ?? 14).toDouble(),
        fontWeight: fontWeight ?? getWeight(),
        fontStyle: fontStyle ?? FontStyle.normal,
        fontFamily: fontFamily
      ),
    );
  }
  FontWeight getWeight() {
    switch (style) {
      case AppTextStyle.manropeExtraLight:
        return FontWeight.w200;
      case AppTextStyle.manropeLight:
        return FontWeight.w300;
      case AppTextStyle.manropeRegular:
        return FontWeight.w400;
      case AppTextStyle.manropeMedium:
        return FontWeight.w500;
      case AppTextStyle.manropeSemiBold:
        return FontWeight.w600;
      case AppTextStyle.manropeBold:
        return FontWeight.w700;
      case AppTextStyle.manropeExtraBold:
        return FontWeight.w800;
      default:
        return FontWeight.w400;
    }
  }
}
