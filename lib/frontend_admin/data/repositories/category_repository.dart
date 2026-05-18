import 'package:help_app_frontend/frontend_admin/data/models/category_model.dart';
import 'package:help_app_frontend/frontend_admin/data/providers/category_provider.dart';

class CategoryRepository {
  final CategoryProvider provider;
  CategoryRepository(this.provider);

  Future<List<CategoryData>> getCategories() async {
    final result = await provider.fetchCategories();
    return result.data ?? [];
  }
}
