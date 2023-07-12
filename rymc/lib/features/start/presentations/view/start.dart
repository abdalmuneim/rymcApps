import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/utils/extension.dart';
import 'package:rymc/common/widgets/custom_elevated_button.dart';
import 'package:rymc/common/widgets/custom_text.dart';
import 'package:rymc/features/start/presentations/providers/home_provider.dart';
import 'package:rymc/generated/assets/assets.dart';
import 'package:rymc/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  late StartProvider read;
  @override
  void initState() {
    read = context.read<StartProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.assetsImagesLogo,
                width: 60.w,
              ),
              10.h.sh,
              CustomText(
                text: S.of(context).compoundAlrazyMedical,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
              ),
              2.h.sh,
              CustomText(
                text: S.of(context).yourDoorToGetService,
                fontSize: 22.sp,
                textAlign: TextAlign.center,
              ),
              20.h.sh,
              CustomElevatedButton(
                onPressed: () => read.navigate(),
                child: Text(
                  S.of(context).start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
