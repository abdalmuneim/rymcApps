import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/helper/validator.dart';
import 'package:rymc/common/resources/app_color.dart';
import 'package:rymc/common/utils/extension.dart';
import 'package:rymc/common/widgets/custom_elevated_button.dart';
import 'package:rymc/common/widgets/custom_text.dart';
import 'package:rymc/common/widgets/custom_text_form_field.dart';
import 'package:rymc/features/family_members/presentations/providers/add_member_provider.dart';
import 'package:rymc/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class AddMemberView extends StatefulWidget {
  const AddMemberView({
    super.key,
  });

  @override
  State<AddMemberView> createState() => _AddMemberViewState();
}

class _AddMemberViewState extends State<AddMemberView> {
  late AddMemberProvider read;
  late AddMemberProvider watch;

  @override
  void didChangeDependencies() {
    read = context.read<AddMemberProvider>();
    watch = context.watch<AddMemberProvider>();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
          key: watch.globalKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 3.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.w,
                  child: CustomText(
                    text: S.of(context).addFamilyFromMember,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                ),
                5.h.sh,
                CustomText(
                  text: S.of(context).name,
                  fontWeight: FontWeight.bold,
                  color: AppColors.title,
                ),
                2.h.sh,
                CustomTextFormField(
                  controller: watch.nameTEXT,
                  textAlign: TextAlign.center,
                  width: 90.w,
                  border: false,
                  validator: (value) => AppValidator.validateFields(
                      value, ValidationType.name, context),
                ),
                5.h.sh,
                CustomText(
                  text: S.of(context).nationalID,
                  fontWeight: FontWeight.bold,
                  color: AppColors.title,
                ),
                2.h.sh,
                CustomTextFormField(
                  controller: watch.nationalIdTEXT,
                  textAlign: TextAlign.center,
                  width: 90.w,
                  border: false,
                  isNumberOnly: true,
                  validator: (value) => AppValidator.validateFields(
                      value, ValidationType.notEmpty, context),
                ),
                10.h.sh,
                watch.isLoading
                    ? const CircularProgressIndicator()
                    : CustomElevatedButton(
                        onPressed: () => read.addMemberToFamily(),
                        child: Text(
                          S.of(context).save,
                        ),
                      ),
                5.h.sh,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
