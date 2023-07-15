import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/resources/app_color.dart';
import 'package:rymc/common/utils/extension.dart';
import 'package:rymc/common/widgets/custom_elevated_button.dart';
import 'package:rymc/common/widgets/custom_list_tile.dart';
import 'package:rymc/common/widgets/custom_text.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';
import 'package:rymc/features/family_members/presentations/providers/family_members_provider.dart';
import 'package:rymc/generated/assets/assets.dart';
import 'package:rymc/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class FamilyMembersView extends StatefulWidget {
  const FamilyMembersView({super.key});

  @override
  State<FamilyMembersView> createState() => _FamilyMembersViewState();
}

class _FamilyMembersViewState extends State<FamilyMembersView> {
  late FamilyMembersProvider read;
  late FamilyMembersProvider watch;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    init();
  }

  init() {
    read = context.read<FamilyMembersProvider>();
    watch = context.watch<FamilyMembersProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 3.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// head
              Container(
                margin: EdgeInsets.only(top: 4.2.h),
                padding: EdgeInsets.symmetric(vertical: 2.h),
                width: 100.w,
                child: CustomListTile(
                  padding: EdgeInsets.zero,
                  leading: Row(
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

              /// body
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// title
                    CustomText(
                      text: S.of(context).familyMembers,
                      fontWeight: FontWeight.bold,
                    ),

                    /// list of family member
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: watch.families.length,
                      itemBuilder: (context, index) {
                        UserModel member = watch.families[index];
                        return SizedBox(
                          height: 12.h,
                          child: Card(
                            elevation: 0,
                            child: Center(
                              child: ListTile(
                                onTap: () => read.goToEditMember(member),
                                visualDensity: VisualDensity.comfortable,
                                title: CustomText(
                                  text: member.name ?? "name",
                                  fontWeight: FontWeight.bold,
                                ),
                                subtitle: CustomText(
                                    text: member.nationalId ?? "nationalId"),
                                trailing: const SizedBox(),
                                leading: Container(
                                  width: 10.w,
                                  height: 10.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.white,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                    ),
                                    onPressed: () =>
                                        read.goToEditMember(member),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    /// container family
                    InkWell(
                      radius: 20,
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: SizedBox(
                        height: 12.h,
                        child: Card(
                          elevation: 0,
                          child: Center(
                            child: ListTile(
                              onTap: () => read.goToAddMember(),
                              visualDensity: VisualDensity.comfortable,
                              title: CustomText(
                                text: S.of(context).addAnotherFamilyMember,
                                fontWeight: FontWeight.bold,
                              ),
                              subtitle: CustomText(
                                  text: S.of(context).additionFamilyMember),
                              trailing: const SizedBox(),
                              leading: Container(
                                width: 10.w,
                                height: 10.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.white,
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                  ),
                                  onPressed: () => read.goToAddMember(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    1.h.sh,
                    const Spacer(),

                    /// end button
                    Center(
                      child: CustomElevatedButton(
                        onPressed: () => read.goToHome(),
                        child: Text(
                          S.of(context).homePage,
                        ),
                      ),
                    ),
                    3.h.sh,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
