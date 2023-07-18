import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rymc/common/resources/app_color.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/extension.dart';
import 'package:rymc/common/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class Utils {
  static BuildContext get _context => NavigationService.context;

  /// bottom sheet
  static Future showBottomSheet(
          {required Widget body, Color? color = AppColors.primary}) =>
      showModalBottomSheet(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: _context,
        builder: (BuildContext context) {
          return body;
        },
      );
  static showSuccess(String message) => showToast(message);

  static showError(String message) =>
      showToast(message, backgroundColor: AppColors.red);

  static showLottieDialog(
      {required String lottie, required String text, List<Widget>? action}) {
    return showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(
                lottie,
              ),
              10.sh,
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(_context).textTheme.headlineLarge,
              ),
              20.sh,
              if (action != null) ...[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: action,
                  ),
                ),
                20.sh,
              ],
            ],
          ),
        ),
      ),
    );
  }

  static void showLoading({String? message}) {}

  /// toast
  static void showToast(String text,
          {Color? backgroundColor, Color? textColor, int? duration}) =>
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          width: MediaQuery.of(_context).size.width - 50,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: duration ?? 4),
          content: CustomText(
            text: text,
            color: textColor ?? Colors.white,
            fontSize: 10.sp,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: backgroundColor ?? AppColors.black.withOpacity(0.7),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      );
}
