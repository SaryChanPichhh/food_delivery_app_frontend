import 'package:help_app_frontend/frontend_admin/data/models/category_model.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/category._infra.dart';
import 'package:help_app_frontend/frontend_admin/data/providers/category_provider.dart';

class CategoryRepository implements CategoryInfra {
  final provider = CategoryProvider();

  @override
  Future<List<CategoryData>> getCategories() async {
    return await provider.getCategories();
  }
}
