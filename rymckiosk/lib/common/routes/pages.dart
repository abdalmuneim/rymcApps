import 'package:get/get.dart';
import 'package:rymckiosk/features/adddoctor_feature/presentations/bindings/adddoctor_binding.dart';
import 'package:rymckiosk/features/adddoctor_feature/presentations/pages/adddoctor_page.dart';
import 'package:rymckiosk/features/doctors_feature/presentations/bindings/doctors_bindings.dart';
import 'package:rymckiosk/features/doctors_feature/presentations/pages/doctors_pages.dart';
import 'package:rymckiosk/features/home_feature/presentations/bindings/home_binding.dart';
import 'package:rymckiosk/features/home_feature/presentations/pages/home_page.dart';
import 'package:rymckiosk/features/language_feature/language_binding.dart';
import 'package:rymckiosk/features/language_feature/language_page.dart';
import 'package:rymckiosk/features/live_feature/presentations/bindings/live_binding.dart';
import 'package:rymckiosk/features/live_feature/presentations/pages/live_page.dart';
import 'package:rymckiosk/features/load_call/load_call_binding.dart';
import 'package:rymckiosk/features/load_call/load_call_page.dart';
import 'package:rymckiosk/features/splash_feature/splash_binding.dart';
import 'package:rymckiosk/features/splash_feature/splash_page.dart';
import 'package:rymckiosk/features/thank/thank_binding.dart';
import 'package:rymckiosk/features/thank/thank_page.dart';
import 'package:rymckiosk/features/user_feature/presentations/bindings/user_bindings.dart';
import 'package:rymckiosk/features/user_feature/presentations/pages/user_page.dart';
part 'routes_string.dart';

abstract class AppPages {
  static final pages = [
    /// initial
    GetPage(
      name: Routes.initial,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.localization,
      page: () => const LocalizationPage(),
      binding: LocalizationBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.doctors,
      page: () => const DoctorsPage(),
      binding: DoctorsBinding(),
    ),
    GetPage(
      name: Routes.user,
      page: () => const UserPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.loadCall,
      page: () => const LoadCallPage(),
      binding: LoadCallBinding(),
    ),
    GetPage(
      name: Routes.live,
      page: () => const LivePage(),
      binding: LiveBinding(),
    ),
    GetPage(
      name: Routes.thank,
      page: () => const ThankPage(),
      binding: ThankBinding(),
    ),
    GetPage(
      name: Routes.addDoctor,
      page: () => AddDoctorPage(),
      binding: AddDoctorBinding(),
    ),
  ];
}
