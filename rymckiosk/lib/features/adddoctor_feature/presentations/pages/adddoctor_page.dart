import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/helper/validator.dart';
import 'package:rymckiosk/common/utils/extension.dart';
import 'package:rymckiosk/common/widgets/custom_text_form_field.dart';
import 'package:rymckiosk/features/adddoctor_feature/presentations/controllers/adddoctor_controller.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class AddDoctorPage extends StatelessWidget {
  const AddDoctorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddDoctorController>(
        builder: (AddDoctorController controller) {
      return Scaffold(
        appBar: AppBar(title: Text(S.of(context).addDoctor)),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Form(
              key: controller.globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// name
                  Text(
                    S.of(context).doctorName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  CustomTextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    width: 70.w,
                    border: true,
                    textEditingController: controller.doctorNameTEXT,
                    textAlign: TextAlign.center,
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.notEmpty, context),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  ),
                  1.h.sh,

                  /// specialty
                  Text(
                    S.of(context).specialty,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  CustomTextFormField(
                    textEditingController: controller.doctorSpecialtyTEXT,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.notEmpty, context),
                    width: 70.w,
                    border: true,
                    textAlign: TextAlign.center,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  ),
                  1.h.sh,

                  /// about
                  Text(
                    S.of(context).aboutDoctor,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  CustomTextFormField(
                    textEditingController: controller.aboutDoctorTEXT,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.notEmpty, context),
                    width: 70.w,
                    border: true,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  ),
                  1.h.sh,

                  /// phone
                  Text(
                    S.of(context).phoneNumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  CustomTextFormField(
                    textEditingController: controller.doctorPhoneTEXT,
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
                  1.h.sh,

                  /// image
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () => controller.getImage(),
                            child: Text(
                              S.of(context).tackPhoto,
                            ),
                          ),
                          if (controller.validImage.isNotEmpty) ...[
                            1.h.sh,
                            Text(
                              controller.validImage,
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .errorStyle,
                            ),
                          ],
                        ],
                      ),
                      if (controller.doctorImage != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            controller.doctorImage!,
                            fit: BoxFit.cover,
                            height: 30.w,
                            width: 30.w,
                          ),
                        ),
                      ],
                    ],
                  ),
                  8.h.sh,

                  /// upload
                  controller.isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () => controller.save(),
                          child: Text(S.of(context).save),
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
