import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/utils/extension.dart';
import 'package:rymckiosk/features/thank/thank_controller.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class ThankPage extends GetView<ThankController> {
  const ThankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// title
              Text(S.of(context).thankYou,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge),
              Text(S.of(context).happyToUseOurService,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge),
              8.h.sh,
              Obx(() => Text(
                  S
                      .of(context)
                      .loadToBackMain(controller.timerDuration.value.inSeconds),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall)),
              18.h.sh,
              ElevatedButton(
                  onPressed: () => controller.navigate(),
                  child: Text(S.of(context).mainPage))
            ],
          ),
        ),
      ),
    );
  }
}
