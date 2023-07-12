import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  AppPermissions() {
    askPermission();
  }
  static askPermission() async {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
      Permission.microphone,
      Permission.bluetooth,
      Permission.phone,
    ].request();

    /// permission phone
    if (statuses[Permission.phone]!.isDenied) {
      await Permission.phone.request().then((value) {
        if (!value.isGranted) {
          print("phone");
          askPermission();
        }
      });
    }

    /// permission microphone
    if (statuses[Permission.microphone]!.isDenied) {
      await Permission.microphone.request().then((value) {
        if (!value.isGranted) {
          print("microphone");
          askPermission();
        }
      });
    }

    /// permission bluetooth
    if (statuses[Permission.bluetooth]!.isDenied) {
      await Permission.bluetooth.request().then((value) {
        if (!value.isGranted) {
          print("bluetooth");
          askPermission();
        }
      });
    }

    /// permission camera
    if (statuses[Permission.camera]!.isDenied) {
      await Permission.camera.request().then((value) {
        if (!value.isGranted) {
          print("camera");
          askPermission();
        }
      });
    }

    /// permission storage
    if (statuses[Permission.storage]!.isDenied) {
      await Permission.storage.request().then((value) {
        if (!value.isGranted) {
          print("storage");
          askPermission();
        }
      });
    }
  }
}
