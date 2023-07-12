import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/app_constant/app_constants.dart';
import 'package:rymckiosk/common/routes/pages.dart';
import 'package:rymckiosk/common/services/fcm_firemessaging.dart';
import 'package:rymckiosk/common/services/firebase_service/doctors_collections.dart';
import 'package:rymckiosk/common/services/firebase_service/firebase_error_hander.dart';
import 'package:rymckiosk/common/utils/utils.dart';
import 'package:rymckiosk/features/doctors_feature/data/models/doctors_model.dart';
import 'package:rymckiosk/features/user_feature/data/models/user_models.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  FCMNotificationFirebase fcmNotificationFirebase;
  late SharedPreferences sharedPreferences;
  UserController({required this.fcmNotificationFirebase});
  final name = TextEditingController();
  final phon = TextEditingController();

  final DoctorModel _doctor = Get.arguments["doctor"];
  DoctorModel get doctor => _doctor;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;

  bool _fieldsColor = false;
  bool get fieldsColor => _fieldsColor;
  onTApFields() {
    _fieldsColor = !_fieldsColor;
    update();
  }

  /// timer in seconds
  late Rx<Duration> timerDuration =
      Rx(Duration(seconds: _maximumTimerSeconds.value));

  /// the maximum timer in seconds
  final Rx<int> _maximumTimerSeconds = Rx(AppConstants.timeOut);

  /// timer start method
  Timer _timer = Timer(Duration.zero, () {});

  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      print(timer.tick);
      if (timer.tick >= _maximumTimerSeconds.value) {
        timer.cancel();
        timerDuration.value = Duration(seconds: _maximumTimerSeconds.value);
        Get.offAllNamed(Routes.home);
        update();
      } else {
        timerDuration.value =
            Duration(seconds: _maximumTimerSeconds.value - timer.tick);
        update();
      }
    });
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  navigateToLive() async {
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      update();
      FocusManager.instance.primaryFocus?.unfocus();

      try {
        await fcmNotificationFirebase.requestPermission();
        // final fcmDoc = await sharedPreferences.getString(Fields.fcmToken);
        final fcmDoc = await getDoctorFCM();
        await fcmNotificationFirebase.initInfo();
        print(fcmDoc);
        await fcmNotificationFirebase.sendPushMessage(
          title: S.of(Get.context!).aCallComingFrom(name.text),
          body: S
              .of(Get.context!)
              .thisImportantCommunicationRelatesToTheCorrectConditionOfThe,
          fcmToken: fcmDoc!,
          data: {
            'doctor': _doctor,
            'user': UserModel(
              name: name.text,
              phone: phon.text,
            ),
          },
        );
        Get.offNamed(
          Routes.live,
          arguments: {
            "doctor": _doctor,
            "user": UserModel(name: name.text, phone: phon.text),
          },
        );
      } catch (e) {
        Utils.showError(S.of(Get.context!).doctorNotAvailable);
        print(e);
        FirebaseErrorsHandel.instance
            .pushErrorToFireStore(e, e.runtimeType, UserController);
      }
      _isLoading = false;
      update();
    }
  }

  Future<String?>? getDoctorFCM() async {
    final DoctorModel? doctor =
        await FireStoreCollectionDoctors.instance.getDoctor(_doctor.phone!);
    print(doctor);
    return doctor?.fcmToken ?? null;
  }

  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    _startTimer();
    super.onInit();
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }
}
