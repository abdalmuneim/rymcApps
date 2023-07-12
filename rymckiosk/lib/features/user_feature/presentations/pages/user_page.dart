import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/helper/validator.dart';
import 'package:rymckiosk/common/resources/app_color.dart';
import 'package:rymckiosk/common/utils/extension.dart';
import 'package:rymckiosk/common/widgets/custom_text_form_field.dart';
import 'package:rymckiosk/features/user_feature/presentations/controllers/user_controller.dart';
import 'package:rymckiosk/generated/assets/assets.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:rymckiosk/injection.dart';
import 'package:sizer/sizer.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(fcmNotificationFirebase: sl()),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              /// timer
              Positioned(
                bottom: 12.h,
                right: 8.w,
                child: Obx(() => Text(
                      controller.timerDuration.value.inSeconds.toString(),
                    )),
              ),

              /// content
              Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// logo
                        Image.asset(
                          Assets.assetsImagesLogo,
                          width: 60.w,
                        ),
                        3.h.sh,

                        ///
                        Text(
                          S.of(context).introduceYourself,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        5.h.sh,

                        Text(
                          S.of(context).name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        1.h.sh,
                        CustomTextFormField(
                          onTap: () => controller.onTApFields(),
                          fillColor: controller.fieldsColor
                              ? AppColors.lightBlue
                              : Colors.white,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          width: 70.w,
                          border: true,
                          textEditingController: controller.name,
                          textAlign: TextAlign.center,
                          validator: (value) => AppValidator.validateFields(
                              value, ValidationType.notEmpty, context),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                        ),
                        4.h.sh,
                        Text(
                          S.of(context).phoneNumber,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        1.h.sh,
                        CustomTextFormField(
                          onTap: () => controller.onTApFields(),
                          fillColor: controller.fieldsColor
                              ? AppColors.lightBlue
                              : Colors.white,
                          textEditingController: controller.phon,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => AppValidator.validateFields(
                              value, ValidationType.phone, context),
                          isNumberOnly: true,
                          width: 70.w,
                          border: true,
                          textAlign: TextAlign.center,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                        ),
                        8.h.sh,
                        controller.isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () => controller.navigateToLive(),
                                child: Text(S.of(context).continueToConsult),
                              ),
                      ],
                    ),
                  ),
                ),
              ),

              /// back button
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 5.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
