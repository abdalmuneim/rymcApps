import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';
import 'package:rymc/features/auth/presentations/views/login_veiw.dart';
import 'package:rymc/features/auth/presentations/views/otp_view.dart';
import 'package:rymc/features/auth/presentations/views/register_view.dart';
import 'package:rymc/features/family_members/presentations/views/add_member_view.dart';
import 'package:rymc/features/family_members/presentations/views/edit_member_view.dart';
import 'package:rymc/features/family_members/presentations/views/family_members_view.dart';
import 'package:rymc/features/home/views/home_view.dart';
import 'package:rymc/features/notification/presentations/views/notification_view.dart';
import 'package:rymc/features/start/presentations/view/start.dart';
import 'package:rymc/features/splash/Splash_view.dart';
part './routes_string.dart';

class Routes {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      /// splash
      GoRoute(
        name: RoutesStrings.splash,
        path: RoutesStrings.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      /// start
      GoRoute(
        name: RoutesStrings.start,
        path: RoutesStrings.start,
        builder: (BuildContext context, GoRouterState state) {
          return const StartView();
        },
      ),

      /// login
      GoRoute(
        name: RoutesStrings.login,
        path: RoutesStrings.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),

      /// otp
      GoRoute(
        name: RoutesStrings.otp,
        path: RoutesStrings.otp,
        builder: (BuildContext context, GoRouterState state) {
          return const OtpView();
        },
      ),

      /// register
      GoRoute(
        name: RoutesStrings.register,
        path: RoutesStrings.register,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterView();
        },
      ),

      /// home
      GoRoute(
        name: RoutesStrings.home,
        path: RoutesStrings.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),

      /// Family Members
      GoRoute(
        name: RoutesStrings.familyMembers,
        path: RoutesStrings.familyMembers,
        builder: (BuildContext context, GoRouterState state) {
          return const FamilyMembersView();
        },
      ),

      /// add Members
      GoRoute(
        name: RoutesStrings.addFamilyMembers,
        path: RoutesStrings.addFamilyMembers,
        builder: (BuildContext context, GoRouterState state) {
          return const AddMemberView();
        },
      ),

      /// edit Members
      GoRoute(
        name: RoutesStrings.editFamilyMembers,
        path: RoutesStrings.editFamilyMembers,
        builder: (BuildContext context, GoRouterState state) {
          String name = state.queryParams["name"] ?? "";
          String nationalId = state.queryParams["nationalId"] ?? "";

          return EditMemberView(
            member: UserModel(
              name: name,
              nationalId: nationalId,
            ),
          );
        },
      ),

      /// notification
      GoRoute(
        name: RoutesStrings.notification,
        path: RoutesStrings.notification,
        builder: (BuildContext context, GoRouterState state) {
          return NotificationView();
        },
      ),
    ],
  );
}
