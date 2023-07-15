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
  late LogInProvider read;
  late LogInProvider watch;

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
    read = context.read<LogInProvider>();
    watch = context.watch<LogInProvider>();
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
                CustomTextFormField(
                  maxLength: AppConstants.phoneLength,
                  counterText: '',
                  controller: watch.phoneTEXT,
                  textAlign: TextAlign.center,
                  width: 90.w,
                  border: false,
                  isNumberOnly: true,
                  validator: (value) => AppValidator.validateFields(
                      value, ValidationType.phone, context),
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
