import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/app_colors.dart';
import 'package:flutter_firebase/ui/controllers/login_controller.dart';
import 'package:flutter_firebase/ui/screens/home_screen.dart';
import 'package:flutter_firebase/ui/services/auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              const Text(
                "Login Screen",
                style: TextStyle(color: AppColors.themeColor, fontSize: 24),
              ),
              TextFormField(
                decoration: InputDecoration(label: const Text("Email")),
              ),
              TextFormField(
                decoration: InputDecoration(label: const Text("Password")),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Login")),
              // Google login button
              ElevatedButton(
                onPressed: () async {
                  UserCredential user = await AuthService().signInWithGoogle();
                  print(user);
                  if (AuthService().getCurrentUser() != null) {
                    Get.to(const HomeScreen());
                  }
                },
                child: Wrap(
                  children: [
                    const Text("Login with google"),
                    const SizedBox(width: 8),
                    const Icon(FontAwesomeIcons.google),
                    const SizedBox(width: 8),
                  ],
                ),
              ),

              // Facebook login button
              ElevatedButton(
                onPressed: () async {
                  await AuthService().signInWithFacebook();

                  if (AuthService().getCurrentUser() != null) {
                    Get.to(const HomeScreen());
                  }
                },
                child: Wrap(
                  children: [
                    const Text("Login with facebook"),
                    const SizedBox(width: 8),
                    const Icon(FontAwesomeIcons.facebook),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
