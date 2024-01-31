import 'dart:async';

import 'package:akshaypratical/controllers/login_controller.dart';
import 'package:akshaypratical/screens/home_screen/home_screen.dart';
import 'package:akshaypratical/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.find<LoginController>();
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      if (controller.storage.read("token") == null ||
          controller.storage.read("token").isBlank) {
        Get.offAll(LoginScreen());
      } else {
        Get.offAll(HomeScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("asset/Fundtool.png"),
      ),
    );
  }
}
