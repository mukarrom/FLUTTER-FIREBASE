import 'package:flutter_firebase/ui/services/auth_service.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  var isLoggedIn = false.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      isLoggedIn.value = AuthService().getCurrentUser() != null;
      update();
    });
  }
}
