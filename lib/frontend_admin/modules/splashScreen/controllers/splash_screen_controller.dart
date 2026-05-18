import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashController extends GetxController {
  final isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    print("✅ onReady called");
    FlutterNativeSplash.remove();
    Future.delayed(const Duration(seconds: 3), () {
      print("🔁 Navigating to login...");
      Get.offNamed(AppRoutes.onBoarding); // Navigate to home after 3 seconds
    });
  }
}
