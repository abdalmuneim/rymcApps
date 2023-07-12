import 'package:flutter/material.dart';
import 'package:rymc/features/splash/splash_provider.dart';
import 'package:rymc/generated/assets/assets.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashProvider read;

  @override
  void initState() {
    read = context.read<SplashProvider>();
    read.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.assetsImagesLogo,
          width: 50.w,
          height: 50.h,
        ),
      ),
    );
  }
}
