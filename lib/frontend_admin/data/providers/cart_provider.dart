import 'dart:convert';
import 'package:help_app_frontend/frontend_admin/data/models/cart_model.dart';
import 'package:help_app_frontend/shared/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class CartProvider {
  final baseUrl = ApiConstants.baseUrl;

  Future<List<CartData>> getCarts() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/carts'),
        headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
      );
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded is Map<String, dynamic>) {
          final model = CartModel.fromJson(decoded);
          return model.data ?? [];
        } else if (decoded is List) {
          return decoded.map((json) => CartData.fromJson(json)).toList();
        }
        return [];
      } else {
        throw Exception('Failed to load carts');
      }
    } catch (e) {
      throw Exception('Failed to load carts: $e');
    }
  }
}
