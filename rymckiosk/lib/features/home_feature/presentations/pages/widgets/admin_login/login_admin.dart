import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/utils/extension.dart';
import 'package:rymckiosk/common/widgets/custom_text_form_field.dart';
import 'package:rymckiosk/features/home_feature/presentations/pages/widgets/admin_login/admin_login_controller.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class LoginAdmin extends StatelessWidget {
  const LoginAdmin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminLoginController>(
      init: AdminLoginController(),
      builder: (controller) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Form(
              key: controller.globalKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// phone
                  Text(
                    S.of(context).phoneNumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  1.h.sh,
                  CustomTextFormField(
                    textEditingController: controller.adminPhone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.validatorPhonedAdmin,
                    isNumberOnly: true,
                    width: 70.w,
                    border: true,
                    textAlign: TextAlign.center,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  ),
                  5.h.sh,

                  /// password
                  Text(
                    S.of(context).password,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  1.h.sh,
                  CustomTextFormField(
                    textEditingController: controller.password,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        controller.validatorPasswordAdmin(value),
                    width: 70.w,
                    border: true,
                    textAlign: TextAlign.center,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  ),
                  5.h.sh,
                  ElevatedButton(
                    onPressed: () => controller.navigateToAdmin(),
                    child: Text(S.of(context).enter),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
