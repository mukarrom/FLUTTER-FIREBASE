import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/app_theme_data.dart';
import 'package:flutter_firebase/controller_binder.dart';
import 'package:flutter_firebase/ui/screens/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class FlutterFirebaseApp extends StatelessWidget {
  const FlutterFirebaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
