import 'package:help_app_frontend/frontend_admin/data/models/restaurant_model.dart';

abstract class RestaurantInfra {
  Future<List<RestaurantData>> getPopularRestaurants();
}
