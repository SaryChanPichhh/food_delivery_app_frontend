import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/utils/key.dart';

import '../../../data/infrastructure/authentication_infrastructure.dart';

class AuthenticationController extends GetxController {
  final authService = Get.find<IAuthenticationService>();
  var userName = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var userType = 0.obs;

  var isLoading = false.obs;
  var isLoggedin = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> register() async {
    try {
      isLoading(true);
      var data = await authService.RegisterService(
        userName.text.trim(),
        password.text.trim(),
        userType.value,
        phone.text.trim(),
        email.text.trim(),
      );
      if (data) {
        Get.offNamed(AppRoutes.login);
      }
    } catch (e) {}
  }

  Future<void> login() async {
    try {
      isLoading(true);
      print(userName.text);
      print(password.text);
      var token = await authService.LoginService(
        userName.text.trim(),
        password.text.trim(),
      );
      print(token);
      if (token.isNotEmpty) {
        isLoggedin(true);
        loginToken.value = token;
        print(token);
        Get.toNamed(AppRoutes.menuBar);
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }
}
