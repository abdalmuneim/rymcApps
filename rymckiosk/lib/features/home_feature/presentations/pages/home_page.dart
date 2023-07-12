import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/utils/extension.dart';
import 'package:rymckiosk/features/home_feature/presentations/controllers/home_controller.dart';
import 'package:rymckiosk/features/home_feature/presentations/pages/widgets/admin_login/login_admin.dart';
import 'package:rymckiosk/generated/assets/assets.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (HomeController controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// logo
                    Image.asset(
                      Assets.assetsImagesLogo,
                      width: 60.w,
                    ),
                    10.h.sh,

                    /// title
                    Text(
                      S.of(context).freeConsultation,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    5.h.sh,

                    /// subtitle
                    Text(
                      S.of(context).subTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    10.h.sh,
                    ElevatedButton(
                      onPressed: () => controller.navigateToDoctors(),
                      child: Text(S.of(context).start),
                    ),
                    3.h.sh,
                    SizedBox(
                      width: 100.w,
                      child: TextButton(
                        onPressed: () {
                          Get.dialog(
                            LoginAdmin(),
                          );
                        },
                        child: Text(
                          S.of(context).loginAdmin,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
