import 'package:flutter/material.dart';
import 'package:rymc/common/resources/app_color.dart';
import 'package:sizer/sizer.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.width,
    this.color,
    this.child,
  });
  final double? width;
  final Color? color;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: width ?? 25.w,
      decoration: BoxDecoration(
        color: color ?? AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}
