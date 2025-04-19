import 'package:flutter/material.dart';
import 'package:flutter_firebase/ui/controllers/splash_screen_controller.dart';
import 'package:flutter_firebase/ui/screens/home_screen.dart';
import 'package:flutter_firebase/ui/screens/login_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.find<SplashScreenController>();
  @override
  void initState() {
    controller.onInit();
    Future.delayed(const Duration(seconds: 1), () {
      if (controller.isLoggedIn.value) {
        Get.to(const HomeScreen());
      } else {
        Get.to(LoginScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(SplashScreenController());
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
      // body: Obx(() {
      //   return Center(child: Text("Flutter Firebase"));
      // }),
    );
  }
}
