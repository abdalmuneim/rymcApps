import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rymckiosk/common/utils/extension.dart';
import 'package:rymckiosk/common/widgets/loading_widget.dart';
import 'package:sizer/sizer.dart';

class Utils {
  /// SUCCESS NOTIFICATION
  static showSuccess(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.rawSnackbar(
      message: message.tr,
      barBlur: 5,
      maxWidth: Get.width,

      snackPosition: SnackPosition.BOTTOM,
      // backgroundColor: ColorManager.green.withOpacity(0.7),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    );
  }

  /// ERROR NOTIFICATION
  static showError(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.rawSnackbar(
      message: message,
      barBlur: 5,
      maxWidth: Get.width,
      backgroundColor: Colors.red,

      snackPosition: SnackPosition.BOTTOM,
      // backgroundColor: ColorManager.red.withOpacity(0.7),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    );
  }

  static showBottomSheet({required String title}) {
    return Get.bottomSheet(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
          child: Text(
            title,
            style: Theme.of(Get.context!)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
          ),
        ),
        isDismissible: false,
        elevation: 0,
        enableDrag: false,
        backgroundColor: Colors.red,
        barrierColor: Colors.white.withOpacity(0));
  }

  static showLottieDialog(
      {required String lottie, required String text, List<Widget>? action}) {
    Get.dialog(
      Dialog(
        child: WillPopScope(
          onWillPop: () async => false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(
                lottie,
              ),
              10.sh,
              Text(
                text,
                textAlign: TextAlign.center,
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

// method for show loading
  static void showLoading({String? message}) {
    Get.dialog(
      Dialog(
        child: WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: 350,
              child: LoadingWidget(
                description: message,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
