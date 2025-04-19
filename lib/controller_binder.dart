import 'package:flutter_firebase/ui/controllers/auth_controller.dart';
import 'package:flutter_firebase/ui/controllers/login_controller.dart';
import 'package:flutter_firebase/ui/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.put(AuthController());
    Get.put(LoginController());
  }
}
