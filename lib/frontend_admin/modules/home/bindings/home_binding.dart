import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/data/providers/category_provider.dart';
import 'package:help_app_frontend/frontend_admin/data/repositories/category_repository.dart';
import 'package:help_app_frontend/frontend_admin/modules/home/controllers/category_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryProvider());
    Get.lazyPut(() => CategoryRepository(Get.find()));
    Get.lazyPut(() => CategoryController(Get.find()));
  }
}
