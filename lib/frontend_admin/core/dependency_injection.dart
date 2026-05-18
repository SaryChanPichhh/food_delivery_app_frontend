import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/data/providers/authentication_service.dart';

import '../modules/splashScreen/controllers/authentication_controller.dart';
import '../data/infrastructure/authentication_infrastructure.dart';

class ServiceRegister extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthenticationService>(
      () => AuthenticationService(),
      fenix: true,
    );

    // Controller Register

    Get.put(AuthenticationController(), permanent: true);
  }
}
