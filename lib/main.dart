import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_page.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_admin/core/dependency_injection.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/food/food_screen.dart';
import 'package:help_app_frontend/utils/constraint.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  Future<Widget> _determineStartPage() async {
    final prefs = await SharedPreferences.getInstance();
    bool? locationAllowed = prefs.getBool('location_allowed');

    if (locationAllowed == true) {
      // Already allowed before → Go to Home
      return FoodScreen();
    } else {
      // Not allowed yet → Show permission screen
      return const LocationPermissionPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.menuBar,
      initialBinding: ServiceRegister(),
      theme: ThemeData(
        fontFamily: "KhmerOSContent",
        scaffoldBackgroundColor: secondaryColor,
      ),
      getPages: AppPages.pages,
    );
  }
}

class LocationPermissionPage extends StatefulWidget {
  const LocationPermissionPage({super.key});

  @override
  State<LocationPermissionPage> createState() => _LocationPermissionPageState();
}

class _LocationPermissionPageState extends State<LocationPermissionPage> {
  String message = "We need your location to continue.";

  Future<void> _checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => message = "Please enable Location Services.");
      return;
    }

    // Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // ✅ Permission granted → Save it
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('location_allowed', true);

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => FoodScreen()),
      );
    } else {
      setState(() => message = "Permission denied. Please allow to continue.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Access")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkPermission,
              child: const Text("Allow Location"),
            ),
          ],
        ),
      ),
    );
  }
}
