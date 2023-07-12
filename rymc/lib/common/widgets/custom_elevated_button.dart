import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.color,
    this.borderRadius = 20,
    required this.child,
    this.side = BorderSide.none,
    this.maximumSize,
    this.minimumSize,
    this.isCircle = false,
    this.elevation,
    this.padding,
  }) : super(key: key);
  final void Function() onPressed;
  final Color? color;
  final double borderRadius;
  final BorderSide side;
  final Size? maximumSize;
  final Size? minimumSize;
  final bool isCircle;
  final double? elevation;
  final Widget child;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          elevation: MaterialStateProperty.all(elevation),
          maximumSize: MaterialStateProperty.all(maximumSize),
          minimumSize: MaterialStateProperty.all(minimumSize),
          backgroundColor: MaterialStateProperty.all(
            color,
          ),
          shape: isCircle
              ? MaterialStateProperty.all<CircleBorder>(
                  CircleBorder(side: side),
                )
              : MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      side: side),
                ),
        ),
        onPressed: onPressed,
        child: child);
  }
}
