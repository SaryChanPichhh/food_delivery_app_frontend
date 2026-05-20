import 'package:help_app_frontend/frontend_admin/data/models/restaurant_model.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/restaurant_infra.dart';
import 'package:help_app_frontend/frontend_admin/data/providers/restaurant_provider.dart';

class RestaurantRepository implements RestaurantInfra {
  final provider = RestaurantProvider();

  @override
  Future<List<RestaurantData>> getPopularRestaurants() async {
    return await provider.getPopularRestaurants();
  }
}
