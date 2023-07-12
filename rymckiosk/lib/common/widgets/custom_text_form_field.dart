import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/resources/app_color.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.maxLines = 1,
    this.minLines = 1,
    this.labelText,
    this.prefixIcon,
    this.fillColor = AppColors.lightBlue,
    this.filled = true,
    this.borderRadius = 10,
    this.obscureText,
    this.border = true,
    this.suffixIcon,
    this.prefixIconColor = Colors.white,
    this.suffixIconColor = Colors.white,
    this.textEditingController,
    this.textDirection,
    this.validator,
    this.onChange,
    this.maxLength,
    this.counterText,
    this.onSave,
    this.enabled,
    this.textAlign = TextAlign.start,
    this.isNumberOnly = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.autofocus,
    this.onFieldSubmitted,
    this.width,
    this.height,
    this.contentPadding,
    this.autovalidateMode = AutovalidateMode.always,
    this.focusNode,
    this.onTap,
  }) : super(key: key);
  final int? maxLines, minLines;
  final String? hintText, labelText;
  final Widget? prefixIcon, suffixIcon;
  final Color fillColor;
  final Color prefixIconColor;
  final Color suffixIconColor;
  final bool? filled, obscureText;
  final bool border;
  final bool isNumberOnly;
  final bool? enabled;
  final TextAlign textAlign;
  final double borderRadius;
  final TextEditingController? textEditingController;
  final TextDirection? textDirection;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final FormFieldSetter<String>? onSave;
  final int? maxLength;
  final double? width;
  final double? height;
  final String? counterText;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final bool? autofocus;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final AutovalidateMode? autovalidateMode;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obsecureText = widget.obscureText ?? false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        onTap: widget.onTap,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        textInputAction: widget.textInputAction,
        autofocus: widget.autofocus ?? false,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        autovalidateMode: widget.autovalidateMode,
        enabled: widget.enabled,
        validator: widget.validator,
        controller: widget.textEditingController,
        onChanged: widget.onChange,
        onSaved: widget.onSave,
        textDirection: widget.textDirection,
        obscureText: obsecureText,
        obscuringCharacter: '*',
        keyboardType: widget.isNumberOnly
            ? const TextInputType.numberWithOptions(decimal: true)
            : widget.keyboardType,
        inputFormatters: widget.isNumberOnly
            ? [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
              ]
            : null,
        style: context.textTheme.titleLarge!.copyWith(color: Colors.black),
        textAlign: widget.textAlign,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          counterText: widget.counterText,
          suffixIcon: widget.suffixIcon ?? toggleVisibility(),
          suffixIconColor: widget.suffixIconColor,
          prefixIcon: widget.prefixIcon,
          prefixIconColor: widget.prefixIconColor,
          contentPadding: widget.contentPadding,
          hintText: widget.hintText,
          hintStyle: context.textTheme.titleLarge?.copyWith(
            color: AppColors.secondary.withOpacity(.5),
            fontSize: 15,
          ),
          labelText: widget.labelText,
          labelStyle: context.textTheme.titleLarge,
          errorStyle: context.textTheme.titleLarge!
              .copyWith(color: Colors.red, fontSize: 8.sp),
          filled: true,
          fillColor: widget.fillColor,
          enabledBorder: widget.border
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide.none,
                )
              : InputBorder.none,
          border: widget.border
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide.none,
                )
              : InputBorder.none,
        ),
      ),
    );
  }

  toggleVisibility() {
    if (obsecureText) {
      return IconButton(
        icon: const Icon(
          Icons.visibility_off_outlined,
          size: 18,
        ),
        onPressed: () {
          setState(() {
            obsecureText = false;
          });
        },
      );
    } else if (widget.obscureText != null) {
      return IconButton(
        icon: const Icon(
          Icons.visibility_outlined,
          size: 18,
        ),
        onPressed: () {
          setState(() {
            obsecureText = true;
          });
        },
      );
    } else {
      return null;
    }
  }
}
