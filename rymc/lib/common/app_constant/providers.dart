import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rymc/features/auth/presentations/providers/login_provider.dart';
import 'package:rymc/features/auth/presentations/providers/otp_provider.dart';
import 'package:rymc/features/auth/presentations/providers/register_provider.dart';
import 'package:rymc/features/family_members/presentations/providers/add_member_provider.dart';
import 'package:rymc/features/family_members/presentations/providers/edit_member_provider.dart';
import 'package:rymc/features/family_members/presentations/providers/family_members_provider.dart';
import 'package:rymc/features/home/pressentations/providers/home_provider.dart';
import 'package:rymc/features/splash/splash_provider.dart';
import 'package:rymc/features/start/presentations/providers/home_provider.dart';

class Providers {
  static List<SingleChildWidget> providers = [
    /// SplashProvider
    ChangeNotifierProvider(create: (_) => SplashProvider()),

    /// StartProvider
    ChangeNotifierProvider(create: (_) => StartProvider()),

    /// LoginProvider
    ChangeNotifierProvider(create: (_) => LoginProvider()),

    /// OtpProvider
    ChangeNotifierProvider(create: (_) => OtpProvider()),

    /// RegisterProvider
    ChangeNotifierProvider(create: (_) => RegisterProvider()),

    /// HomeProvider
    ChangeNotifierProvider(create: (_) => HomeProvider()),

    /// FamilyMembersProvider
    ChangeNotifierProvider(create: (_) => FamilyMembersProvider()),

    /// Add MemberProvider
    ChangeNotifierProvider(create: (_) => AddMemberProvider()),

    /// edit MemberProvider
    ChangeNotifierProvider(create: (_) => EditMemberProvider()),
  ];
}
