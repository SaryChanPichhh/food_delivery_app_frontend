import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/category._infra.dart';
import 'package:help_app_frontend/frontend_admin/data/providers/authentication_service.dart';
import 'package:help_app_frontend/frontend_admin/data/providers/category_provider.dart';
import 'package:help_app_frontend/frontend_admin/data/repositories/category_repository.dart';
import 'package:help_app_frontend/frontend_admin/modules/home/controllers/category_controller.dart';

import '../modules/splashScreen/controllers/authentication_controller.dart';
import '../data/infrastructure/authentication_infrastructure.dart';

import 'package:help_app_frontend/frontend_admin/data/infrastructure/restaurant_infra.dart';
import 'package:help_app_frontend/frontend_admin/data/repositories/restaurant_repository.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/cart_infra.dart';
import 'package:help_app_frontend/frontend_admin/data/repositories/cart_repository.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/discount_menu_infra.dart';
import 'package:help_app_frontend/frontend_admin/data/repositories/discount_menu_repository.dart';

class ServiceRegister extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthenticationService>(
      () => AuthenticationService(),
      fenix: true,
    );
    Get.lazyPut<CategoryInfra>(() => CategoryRepository(), fenix: true);
    Get.lazyPut<RestaurantInfra>(() => RestaurantRepository(), fenix: true);
    Get.lazyPut<CartInfra>(() => CartRepository(), fenix: true);
    Get.lazyPut<DiscountMenuInfra>(() => DiscountMenuRepository(), fenix: true);
    // Controller Register

    Get.put(AuthenticationController(), permanent: true);
  }
}
