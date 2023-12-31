import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rymc/features/auth/presentations/providers/login_provider.dart';
import 'package:rymc/features/auth/presentations/providers/otp_provider.dart';
import 'package:rymc/features/auth/presentations/providers/register_provider.dart';
import 'package:rymc/features/family_members/presentations/providers/add_member_provider.dart';
import 'package:rymc/features/family_members/presentations/providers/edit_member_provider.dart';
import 'package:rymc/features/family_members/presentations/providers/family_members_provider.dart';
import 'package:rymc/features/home/providers/home_provider.dart';
import 'package:rymc/features/notification/presentations/providers/notification_provider.dart';
import 'package:rymc/features/splash/splash_provider.dart';
import 'package:rymc/features/start/presentations/providers/home_provider.dart';
import 'package:rymc/injection.dart';

class Providers {
  static List<SingleChildWidget> providers = [
    /// SplashProvider
    ChangeNotifierProvider(create: (_) => SplashProvider(sl(), sl())),

    /// StartProvider
    ChangeNotifierProvider(create: (_) => StartProvider()),

    /// LoginProvider
    ChangeNotifierProvider(create: (_) => LogInProvider(sl(), sl())),

    /// OtpProvider
    ChangeNotifierProvider(
        create: (_) => OtpProvider(sl(), sl(), sl(), sl(), sl())),

    /// RegisterProvider
    ChangeNotifierProvider(create: (_) => RegisterProvider(sl(), sl())),

    /// HomeProvider
    ChangeNotifierProvider(create: (_) => HomeProvider(sl(), sl(), sl())),

    /// FamilyMembersProvider
    ChangeNotifierProvider(create: (_) => FamilyMembersProvider(sl())),

    /// Add MemberProvider
    ChangeNotifierProvider(create: (_) => AddMemberProvider(sl())),

    /// edit MemberProvider
    ChangeNotifierProvider(create: (_) => EditMemberProvider(sl())),

    /// notification Provider
    ChangeNotifierProvider(create: (_) => NotificationProvider(sl())),
  ];
}
