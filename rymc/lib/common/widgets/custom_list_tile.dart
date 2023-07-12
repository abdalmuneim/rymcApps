import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.title,
    this.subtitle,
    this.trailing,
    this.leading,
    this.padding,
  });
  final Widget? title, subtitle, trailing, leading;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (leading != null) ...[leading!],
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (title != null) ...[title!],
              if (subtitle != null) ...[subtitle!],
            ],
          ),
          if (trailing != null) ...[trailing!],
        ],
      ),
    );
  }
}
