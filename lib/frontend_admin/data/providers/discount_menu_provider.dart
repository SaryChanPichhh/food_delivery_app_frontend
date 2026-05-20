import 'dart:convert';
import 'package:help_app_frontend/frontend_admin/data/models/discount_menu_model.dart';
import 'package:help_app_frontend/shared/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class DiscountMenuProvider {
  final baseUrl = ApiConstants.baseUrl;

  Future<List<DiscountMenuData>> getDiscountedMenus() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/coupons/dis-on-menu'),
        headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
      );
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded['success'] == true && decoded['data'] is List) {
          final List list = decoded['data'];
          return list.map((json) => DiscountMenuData.fromJson(json)).toList();
        }
        return [];
      } else {
        throw Exception('Failed to load discounted menus');
      }
    } catch (e) {
      throw Exception('Failed to load discounted menus: $e');
    }
  }
}
