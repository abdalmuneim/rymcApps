import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/utils/extension.dart';
import 'package:rymckiosk/features/doctors_feature/presentations/controllers/doctors_controller.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorsController>(
        builder: (DoctorsController controller) {
      return Scaffold(
        body: Stack(
          children: [
            /// timer down
            Positioned(
              bottom: 12.h,
              right: 8.w,
              child: Text(
                controller.timerDuration.value.inSeconds.toString(),
              ),
            ),

            /// content
            controller.isLoading
                ? CircularProgressIndicator()
                : controller.allDoctors.isNotEmpty
                    ? PageView(
                        controller: controller.controller,
                        onPageChanged: controller.onPageChanged,
                        children: controller.allDoctors
                            .map(
                              (doctor) => Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: doctor.img ?? "",
                                      width: 60.w,
                                      height: 60.w,
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) =>
                                          Text(S.of(context).errorLoaded),
                                      progressIndicatorBuilder: (context,
                                          String url,
                                          DownloadProgress progress) {
                                        return Center(
                                          child: Center(
                                            child: Container(
                                              width: 60.w,
                                              height: 80.w,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    1.h.sh,
                                    Text(
                                      doctor.name ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    1.h.sh,
                                    Text(
                                      doctor.specialty ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      textAlign: TextAlign.center,
                                    ),
                                    3.h.sh,
                                    ElevatedButton(
                                      onPressed: () =>
                                          controller.navigate(doctor),
                                      child:
                                          Text(S.of(context).continueToConsult),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    : Center(
                        child: Text(
                          S.of(context).noDoctorsYetWaitToAdd,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),

            /// back button
            Positioned(
              top: 8.h,
              left: 8.w,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 5.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
