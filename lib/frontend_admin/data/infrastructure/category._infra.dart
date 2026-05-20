import 'package:help_app_frontend/frontend_admin/data/models/category_model.dart';

abstract class CategoryInfra {
  Future<List<CategoryData>> getCategories();
}
