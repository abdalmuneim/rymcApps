import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/resources/app_color.dart';
import 'package:rymc/common/utils/extension.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/common/widgets/circle_avatar.dart';
import 'package:rymc/common/widgets/custom_list_tile.dart';
import 'package:rymc/common/widgets/custom_text.dart';
import 'package:rymc/features/home/pressentations/providers/home_provider.dart';
import 'package:rymc/generated/assets/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rymc/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeProvider read;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    init();
  }

  init() {
    read = context.read<HomeProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// head
            Container(
              margin: EdgeInsets.only(top: 4.2.h),
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
              width: 100.w,
              child: ListTile(
                leading: const CustomCircleAvatar(),
                title: CustomText(
                  text: S.of(context).welcome,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: const CustomText(
                  text: "محمد الحسن",
                  fontWeight: FontWeight.bold,
                ),
                trailing: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                          onTap: () {},
                          customBorder: const CircleBorder(),
                          child: SvgPicture.asset(Assets.assetsSvgCall)),
                      2.w.sw,
                      InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {},
                          child:
                              SvgPicture.asset(Assets.assetsSvgNotificationIc)),
                    ],
                  ),
                ),
              ),
            ),
            15.h.sh,

            /// body
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /// title
                  CustomText(
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    text: S.of(context).homeTitle,
                  ),
                  3.h.sh,

                  /// container QR
                  InkWell(
                    onTap: () => Utils.showBottomSheet(
                      body: Column(
                        children: <Widget>[
                          /// close button
                          IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 30,
                              color: AppColors.white,
                            ),
                          ),
                          5.h.sh,

                          /// title
                          CustomText(
                            text: S.of(context).greatClint,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                          3.h.sh,

                          /// qr
                          Image.asset(
                            Assets.assetsImagesQr,
                          ),
                          3.h.sh,

                          /// user name
                          CustomText(
                            text: "محمد منصور الحسن",
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                          3.h.sh,

                          /// user name
                          CustomText(
                            text: "0123456789",
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                          3.h.sh,
                        ],
                      ),
                    ),
                    child: SizedBox(
                      width: 100.w,
                      height: 50.w,
                      child: Card(
                        color: AppColors.primary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CustomText(
                              text: S.of(context).welcomeClient,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            const CustomText(
                              text: "محمد منصور الحسن",
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            const CustomText(
                              text: "اضغط هنا لاظهار باركود العضوية",
                              color: AppColors.white,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  3.h.sh,

                  /// container family
                  InkWell(
                    radius: 20,
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => read.navToFamilyMembers(),
                    child: SizedBox(
                      height: 12.h,
                      child: Card(
                        elevation: 0,
                        color: AppColors.white,
                        child: CustomListTile(
                            title: CustomText(
                              text: S.of(context).familyMembers,
                              fontWeight: FontWeight.bold,
                            ),
                            subtitle:
                                CustomText(text: S.of(context).addFamilyMember),
                            leading: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                              ),
                              onPressed: () {},
                            )),
                      ),
                    ),
                  ),
                  5.h.sh,

                  /// booking
                  Container(
                    height: 8.h,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.primary,
                          AppColors.green,
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const CustomText(
                          text: "قريبا احجز موعدك",
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        3.w.sw,
                        SvgPicture.asset(
                          Assets.assetsSvgAddBooking,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
