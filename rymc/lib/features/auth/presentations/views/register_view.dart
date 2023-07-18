import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/helper/validator.dart';
import 'package:rymc/common/resources/app_color.dart';
import 'package:rymc/common/utils/extension.dart';
import 'package:rymc/common/widgets/custom_elevated_button.dart';
import 'package:rymc/common/widgets/custom_text.dart';
import 'package:rymc/common/widgets/custom_text_form_field.dart';
import 'package:rymc/features/auth/presentations/providers/register_provider.dart';
import 'package:rymc/generated/assets/assets.dart';
import 'package:rymc/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterProvider read;
  late RegisterProvider watch;

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
    read = context.read<RegisterProvider>();
    watch = context.watch<RegisterProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Form(
            key: watch.globalKey,
            child: SingleChildScrollView(
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
                          onPressed: () => read.register(),
                          child: Text(
                            S.of(context).continuo,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
