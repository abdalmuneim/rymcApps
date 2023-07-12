import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/app_constant/app_constants.dart';
import 'package:rymckiosk/common/utils/extension.dart';
import 'package:rymckiosk/features/language_feature/language_controller.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class LocalizationPage extends StatelessWidget {
  const LocalizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (LocalizationController controller) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(title: Text(S.of(context).chooseLang)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                  child: GridView.builder(
                    itemCount: AppConstants.languages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final langs = AppConstants.languages[index];
                      return Obx(
                        () => InkWell(
                          onTap: () {
                            controller.setLanguage(langs.languageCode);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[200]!,
                                    blurRadius: 5,
                                    spreadRadius: 1),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  5.sh,
                                  Text(
                                    langs.languageName,
                                  ),
                                  controller.selectedLang.value ==
                                          langs.languageCode
                                      ? Icon(
                                          Icons.check_circle,
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () => controller.navigate(),
                  child: Text(S.of(context).save),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
