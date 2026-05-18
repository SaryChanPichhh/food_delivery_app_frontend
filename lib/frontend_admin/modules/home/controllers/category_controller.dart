import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/data/models/category_model.dart';
import 'package:help_app_frontend/frontend_admin/data/repositories/category_repository.dart';

class CategoryController extends GetxController {
  final CategoryRepository repository;

  CategoryController(this.repository);

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
      final result = await repository.getCategories();
      categories.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
