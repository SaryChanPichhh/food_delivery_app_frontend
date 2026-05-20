import 'dart:convert';
import 'package:help_app_frontend/frontend_admin/data/models/restaurant_model.dart';
import 'package:help_app_frontend/shared/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class RestaurantProvider {
  final baseUrl = ApiConstants.baseUrl;

  Future<List<RestaurantData>> getPopularRestaurants() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/restaurants/popular-restaurant'),
        headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
      );
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded is List) {
          return decoded.map((json) => RestaurantData.fromJson(json)).toList();
        } else if (decoded is Map<String, dynamic>) {
          final model = RestaurantModel.fromJson(decoded);
          return model.data ?? [];
        }
        return [];
      } else {
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      throw Exception('Failed to load restaurants: $e');
    }
  }
}
