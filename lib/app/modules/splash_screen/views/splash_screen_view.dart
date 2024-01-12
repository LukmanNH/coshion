import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:coshion/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.scale(
        backgroundColor: const Color(0xFF424242),
        childWidget: SizedBox(
          height: 300,
          child: Image.asset("assets/images/logo.png"),
        ),
        duration: const Duration(milliseconds: 1500),
        animationDuration: const Duration(milliseconds: 1000),
        onAnimationEnd: () => debugPrint("On Scale End"),
        nextScreen: LoginView(),
      ),
    );
  }
}
