import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/features/live_feature/presentations/controllers/live_controller.dart';
import 'package:rymckiosk/features/load_call/load_call_page.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveController>(
        init: LiveController(),
        builder: (controller) {
          print(controller.users.length);
          return Scaffold(
            body: SafeArea(
              child: controller.users == 1
                  ? LoadCallPage()
                  : Stack(
                      children: [
                        AgoraVideoViewer(client: controller.client),
                        AgoraVideoButtons(
                          client: controller.client,
                          onDisconnect: () => controller.endCall(),
                        ),
                      ],
                    ),
            ),
          );
        });
  }
}
