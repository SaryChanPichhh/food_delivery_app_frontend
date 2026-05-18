import 'dart:convert';
import 'package:help_app_frontend/frontend_admin/data/models/category_model.dart';
import 'package:help_app_frontend/shared/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class CategoryProvider {
  final baseUrl = ApiConstants.baseUrl;

  Future<CategoryModel> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/categories'));
      if (response.statusCode == 200) {
        return CategoryModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}
