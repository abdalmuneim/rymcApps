import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/app_constant/app_constants.dart';
import 'package:rymc/common/helper/validator.dart';
import 'package:rymc/common/resources/app_color.dart';
import 'package:rymc/common/utils/extension.dart';
import 'package:rymc/common/widgets/custom_elevated_button.dart';
import 'package:rymc/common/widgets/custom_text.dart';
import 'package:rymc/common/widgets/custom_text_form_field.dart';
import 'package:rymc/features/auth/presentations/providers/login_provider.dart';
import 'package:rymc/generated/assets/assets.dart';
import 'package:rymc/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LogInProvider read = context.read<LogInProvider>();
  late LogInProvider watch = context.watch<LogInProvider>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    init();
  }

  init() async {
    read.init();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Form(
            key: watch.globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.assetsImagesLogo,
                  width: 60.w,
                ),
                5.h.sh,
                CustomText(
                  text: S.of(context).phoneNumber,
                  fontWeight: FontWeight.bold,
                  color: AppColors.title,
                ),
                2.h.sh,
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextFormField(
                          maxLength: AppConstants.phoneLength,
                          counterText: '',
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          controller: watch.phoneTEXT,
                          textAlign: TextAlign.left,
                          border: false,
                          isNumberOnly: true,
                          validator: (value) => AppValidator.validateFields(
                              value, ValidationType.phone, context),
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          controller: watch.countryCodeTEXT,
                          textAlign: TextAlign.right,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          border: false,
                          enabled: false,
                          fillColor: AppColors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                10.h.sh,
                watch.isLoading
                    ? const CircularProgressIndicator()
                    : CustomElevatedButton(
                        onPressed: () => read.sendValidateCode(),
                        child: Text(
                          S.of(context).sendValidateCode,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
