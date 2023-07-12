import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/services/device_id.dart';
import 'package:rymckiosk/common/services/fcm_firemessaging.dart';
import 'package:rymckiosk/common/services/firebase_service/doctors_collections.dart';
import 'package:rymckiosk/common/services/firebase_service/firebase_error_hander.dart';
import 'package:rymckiosk/common/utils/fields.dart';
import 'package:rymckiosk/common/utils/utils.dart';
import 'package:rymckiosk/features/doctors_feature/data/models/doctors_model.dart';
import 'package:rymckiosk/features/home_feature/data/models/enums.dart';
import 'package:rymckiosk/common/services/firebase_service/fcm_token_collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendFCMController extends GetxController {
  FCMNotificationFirebase fcmNotificationFirebase;
  SendFCMController({required this.fcmNotificationFirebase});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  UserType _userType = UserType.Doctors;
  final phoneTEXT = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;

  UserType get userType => _userType;
  onChangeUserType(UserType userType) {
    _userType = userType;
    update();
  }

  late SharedPreferences _sharedPreferences;

  sendFCMToFirebase() async {
    try {
      _isLoading = true;
      update();
      final String? deviceId = await DeviceIdService.instance.getDeviceId();
      final String? fcm = await fcmNotificationFirebase.getFCMToken();

      await _sharedPreferences.setString(Fields.fcmToken, fcm!);
      print(fcm);
      if (_globalKey.currentState!.validate()) {
        try {
          switchUserType(userType: _userType, deviceId: deviceId!, fcm: fcm);
          _isLoading = false;
          update();
          if (Get.isDialogOpen!) {
            Get.back();
          }
        } catch (e) {
          _isLoading = false;
          update();
        }
      } else {
        _isLoading = false;
        update();
      }
    } catch (e) {
      _isLoading = false;
      update();
      print(e);
      FirebaseErrorsHandel.instance
          .pushErrorToFireStore(e, e.runtimeType, SendFCMController);
    }
  }

  @override
  void onInit() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    super.onInit();
  }

  switchUserType(
      {required UserType userType,
      required String deviceId,
      required String fcm,
      String? error}) async {
    switch (userType) {
      case UserType.Doctors:
        final doctors = await FireStoreCollectionDoctors.instance.getDoctors();
        if (doctors.isNotEmpty) {
          DoctorModel? doctor;
          for (DoctorModel e in doctors) {
            if (e.phone == phoneTEXT.text) {
              doctor = e;
            }
          }
          if (doctor != null) {
            final data = DoctorModel(
              name: doctor.name,
              phone: doctor.phone,
              deviceId: deviceId,
              img: doctor.img,
              specialty: doctor.specialty,
              aboutDoctor: doctor.aboutDoctor,
              fcmToken: fcm,
              createdAt: DateTime.now().toString(),
            );
            await FireStoreCollectionDoctors.instance.updateDoctor(data);
          }
        }

        await await FireStoreFCMToken.instance.addFCMTokenToFireStore(
          _userType,
          DoctorModel(
            phone: phoneTEXT.text,
            deviceId: deviceId,
            fcmToken: fcm,
          ),
        );

        await _sharedPreferences.setString(Fields.loginDoctor, phoneTEXT.text);
        break;
      case UserType.User:
        await FireStoreFCMToken.instance.addFCMTokenToFireStore(
          _userType,
          DoctorModel(
            deviceId: deviceId,
            fcmToken: fcm,
          ),
        );
        await _sharedPreferences.setString(Fields.loginUser, deviceId);
        break;
      default:
        Utils.showError(error ?? "");
    }
  }
}
