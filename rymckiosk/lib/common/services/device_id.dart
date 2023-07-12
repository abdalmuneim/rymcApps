import 'package:flutter/services.dart';
import 'package:unique_identifier/unique_identifier.dart';

class DeviceIdService {
  static DeviceIdService instance = _init;

  static final DeviceIdService _init = DeviceIdService();

  Future<String?> getDeviceId() async {
    String? deviceId;

    try {
      deviceId = await UniqueIdentifier.serial;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }
    if (deviceId != null) {
      return deviceId;
    }
    return null;
  }
}
