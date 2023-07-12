import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/helper/validator.dart';
import 'package:rymckiosk/common/widgets/custom_text_form_field.dart';
import 'package:rymckiosk/features/home_feature/data/models/enums.dart';
import 'package:rymckiosk/common/utils/extension.dart';
import 'package:rymckiosk/features/home_feature/presentations/pages/widgets/send_fcm/send_fcm_controller.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:rymckiosk/injection.dart';
import 'package:sizer/sizer.dart';

class SendFcm extends StatelessWidget {
  const SendFcm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SendFCMController>(
      init: SendFCMController(fcmNotificationFirebase: sl()),
      builder: (controller) {
        return Dialog(
          child: Form(
            key: controller.globalKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// doctor
                RadioListTile<UserType?>(
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: UserType.Doctors,
                  title: Text(
                    S.of(context).areYouDoctor,
                  ),
                  onChanged: (UserType? value) =>
                      controller.onChangeUserType(value!),
                  groupValue: controller.userType,
                ),
                if (controller.userType == UserType.Doctors) ...[
                  3.h.sh,
                  Text(
                    S.of(context).phoneNumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  1.h.sh,
                  CustomTextFormField(
                    textEditingController: controller.phoneTEXT,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.phone, context),
                    isNumberOnly: true,
                    width: 70.w,
                    border: true,
                    textAlign: TextAlign.center,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  ),
                  3.h.sh,
                ],

                /// user
                RadioListTile<UserType?>(
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: UserType.User,
                  title: Text(
                    S.of(context).areYouUser,
                  ),
                  onChanged: (UserType? value) =>
                      controller.onChangeUserType(value!),
                  groupValue: controller.userType,
                ),
                3.h.sh,
                controller.isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () => controller.sendFCMToFirebase(),
                        child: Text(S.of(context).save),
                      ),
                5.h.sh,
              ],
            ),
          ),
        );
      },
    );
  }
}
