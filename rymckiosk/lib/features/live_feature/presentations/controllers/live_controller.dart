// import 'package:agora_uikit/agora_uikit.dart';

import 'package:agora_rtc_engine/src/agora_rtc_engine_ex.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/app_constant/api_keys.dart';
import 'package:rymckiosk/common/routes/pages.dart';
import 'package:rymckiosk/features/doctors_feature/data/models/doctors_model.dart';
import 'package:rymckiosk/features/load_call/load_call_controller.dart';
import 'package:rymckiosk/features/user_feature/data/models/user_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LiveController extends GetxController {
  static LiveController get to => Get.find<LiveController>();
  List<int?> _users = [];
  List<int?> get users => _users;
  DoctorModel? _doctor = Get.arguments["doctor"];
  DoctorModel? get doctor => _doctor;
  UserModel? _user = Get.arguments["user"];
  UserModel? get user => _user;
  late SharedPreferences _preferences;
  int? _remoteUid;
  int? get remoteUid => _remoteUid;

  bool _localUserJoined = false;
  bool get localUserJoined => _localUserJoined;

  AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: ApiKeys.agoraAppID,
      channelName: Get.arguments["user"].phone,
    ),
    agoraEventHandlers: AgoraRtcEventHandlers(
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) async {
        List<int?> u = [];
        u.add(connection.localUid);
        // _users.add(connection.localUid);
      },
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );

  @override
  void onInit() async {
    await Get.put(LoadCallController());
    _preferences = await SharedPreferences.getInstance();
    await client.initialize();
    super.onInit();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  endCall() {
    _isLoading = true;
    update();
    Get.delete<LoadCallController>();

    _isLoading = false;
    update();
    Get.offAllNamed(Routes.thank);
  }

  @override
  void dispose() {
    Get.delete<LoadCallController>();

    super.dispose();
  }
}
