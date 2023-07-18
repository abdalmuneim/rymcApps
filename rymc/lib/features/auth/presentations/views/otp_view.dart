import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/app_constant/app_constants.dart';
import 'package:rymc/common/helper/validator.dart';
import 'package:rymc/common/resources/app_color.dart';
import 'package:rymc/common/utils/extension.dart';
import 'package:rymc/common/widgets/custom_elevated_button.dart';
import 'package:rymc/common/widgets/custom_text.dart';
import 'package:rymc/common/widgets/custom_text_form_field.dart';
import 'package:rymc/features/auth/presentations/providers/otp_provider.dart';
import 'package:rymc/generated/assets/assets.dart';
import 'package:rymc/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  late OtpProvider read = context.read<OtpProvider>();
  late OtpProvider watch = context.watch<OtpProvider>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    read.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                text: S.of(context).verificationCode,
                fontWeight: FontWeight.bold,
                color: AppColors.title,
              ),
              2.h.sh,
              CustomTextFormField(
                maxLength: AppConstants.codeLength,
                counterText: '',
                textAlign: TextAlign.center,
                controller: watch.codeTEXT,
                width: 90.w,
                border: false,
                isNumberOnly: true,
                validator: (value) => AppValidator.validateFields(
                    value, ValidationType.validationCode, context),
              ),
              3.h.sh,
              TextButton(
                onPressed:
                    watch.timerDuration.inSeconds != 0 ? null : read.resendOTP,
                child: watch.isLoadingResent
                    ? CircularProgressIndicator()
                    : Selector<OtpProvider, Duration>(
                        selector: (_, OtpProvider provider) =>
                            provider.timerDuration,
                        builder: (_, Duration duration, __) {
                          final int seconds = duration.inSeconds;
                          return TextButton(
                            onPressed: seconds != 0 ? null : read.resendOTP(),
                            child: CustomText(
                              text: (seconds == 0
                                  ? S.of(context).resendOTP
                                  : '${S.of(context).resendOTPAfter}: ${'${duration.inMinutes.getDurationReminder}:${seconds.remainder(60).getDurationReminder}'}'),
                            ),
                          );
                        }),
              ),
              10.h.sh,
              watch.isLoading
                  ? const CircularProgressIndicator()
                  : CustomElevatedButton(
                      onPressed: () => read.verificationCode(),
                      child: Text(
                        S.of(context).verification,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
