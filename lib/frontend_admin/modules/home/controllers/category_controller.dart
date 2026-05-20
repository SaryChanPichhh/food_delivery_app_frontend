import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/category._infra.dart';
import 'package:help_app_frontend/frontend_admin/data/models/category_model.dart';

class CategoryController extends GetxController {
  final categoryRepository = Get.find<CategoryInfra>();
  var categories = <CategoryData>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    fetchCategories();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      final result = await categoryRepository.getCategories();
      categories.assignAll(result);
      print('categories: $categories');
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }
}
