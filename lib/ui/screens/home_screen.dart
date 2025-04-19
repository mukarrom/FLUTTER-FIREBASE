import 'package:flutter/material.dart';
import 'package:flutter_firebase/ui/screens/login_screen.dart';
import 'package:flutter_firebase/ui/services/auth_service.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          if (AuthService().getCurrentUser() != null)
            IconButton(
              onPressed: () async {
                await AuthService().signOut();
                if (AuthService().getCurrentUser() == null) {
                  Get.offAll(const LoginScreen());
                }
              },
              icon: const Icon(Icons.logout),
            ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  Text(
                    AuthService().getCurrentUser()!.displayName!,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(AuthService().getCurrentUser()!.email!),
                ],
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(child: Text("Home Screen")),
    );
  }
}
