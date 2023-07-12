import 'package:flutter/material.dart';
import 'package:rymc/common/resources/app_color.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.textAlign,
    this.backgroundColor,
    this.color = AppColors.title,
    this.fontWeight = FontWeight.w500,
    this.maxLines,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final int? maxLines;
  final Color? color;
  final Color? backgroundColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            backgroundColor: backgroundColor,
            decoration: textDecoration,
            fontStyle: fontStyle,
          ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
