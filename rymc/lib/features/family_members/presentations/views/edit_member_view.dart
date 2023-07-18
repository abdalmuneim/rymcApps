import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/helper/validator.dart';
import 'package:rymc/common/resources/app_color.dart';
import 'package:rymc/common/utils/extension.dart';
import 'package:rymc/common/widgets/custom_elevated_button.dart';
import 'package:rymc/common/widgets/custom_text.dart';
import 'package:rymc/common/widgets/custom_text_form_field.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';
import 'package:rymc/features/family_members/presentations/providers/edit_member_provider.dart';
import 'package:rymc/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class EditMemberView extends StatefulWidget {
  const EditMemberView({super.key, required this.member});
  final UserModel member;
  @override
  State<EditMemberView> createState() => _EditMemberViewState();
}

class _EditMemberViewState extends State<EditMemberView> {
  late EditMemberProvider read;
  late EditMemberProvider watch;

  @override
  void didChangeDependencies() {
    read = context.read<EditMemberProvider>();
    watch = context.watch<EditMemberProvider>();

    watch.nameTEXT.text = widget.member.name ?? "";
    watch.nationalIdTEXT.text = widget.member.nationalId ?? "";
    watch.nationalId = widget.member.nationalId ?? "";
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
                    text: S.of(context).editFamilyFromMember,
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
                  enabled: false,
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
                    : Column(
                        children: <Widget>[
                          CustomElevatedButton(
                            onPressed: () => read.editMemberToFamily(),
                            child: Text(
                              S.of(context).save,
                            ),
                          ),
                          5.h.sh,
                          CustomElevatedButton(
                            color: AppColors.red,
                            onPressed: () =>
                                read.removeMemberFromFamily(widget.member),
                            child: Text(
                              S.of(context).delete,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
