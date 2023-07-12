part of './pages.dart';

abstract class Routes {
  Routes._();
  static const initial = _Paths.splash;
  static const localization = _Paths.language;
  static const home = _Paths.home;
  static const doctors = _Paths.doctors;
  static const user = _Paths.user;
  static const loadCall = _Paths.loadCall;
  static const live = _Paths.live;
  static String thank = _Paths.thank;
  static String addDoctor = _Paths.addDoctor;
}

abstract class _Paths {
  static const splash = '/';
  static const language = '/language';
  static const home = '/home';
  static const doctors = '/doctors';
  static const user = '/user';
  static const loadCall = '/loadCall';
  static const live = '/live';
  static const thank = '/thank';
  static const addDoctor = '/addDoctor';
}
