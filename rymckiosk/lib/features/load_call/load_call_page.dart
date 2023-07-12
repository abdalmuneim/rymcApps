import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/resources/app_color.dart';
import 'package:rymckiosk/common/utils/extension.dart';
import 'package:rymckiosk/features/live_feature/presentations/controllers/live_controller.dart';
import 'package:rymckiosk/features/load_call/load_call_controller.dart';
import 'package:rymckiosk/generated/assets/assets.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class LoadCallPage extends GetView<LoadCallController> {
  const LoadCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// logo
            Image.asset(
              Assets.assetsImagesLogo,
              width: 60.w,
            ),
            3.h.sh,

            /// title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                S.of(context).titleLoadCall,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.mainApp,
                    ),
              ),
            ),
            5.h.sh,
            Text(
              LiveController.to.doctor?.name ?? "",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            3.h.sh,
            Text(
              LiveController.to.doctor?.specialty ?? "",
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
            2.h.sh,
            LiveController.to.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.red),
                    ),
                    onPressed: () => LiveController.to.endCall(),
                    child: Text(
                      S.of(context).end,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
