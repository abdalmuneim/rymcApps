import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/utils/extension.dart';
import 'package:rymckiosk/features/splash_feature/splash_controller.dart';
import 'package:rymckiosk/generated/assets/assets.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (SplashController controller) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.assetsImagesLogo,
                  width: 50.w,
                ),
                18.h.sh,
                const CircularProgressIndicator()
              ],
            ),
          ),
        );
      },
    );
  }
}
