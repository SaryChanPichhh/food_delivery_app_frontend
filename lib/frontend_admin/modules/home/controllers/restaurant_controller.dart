import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/restaurant_infra.dart';
import 'package:help_app_frontend/frontend_admin/data/models/restaurant_model.dart';

class RestaurantController extends GetxController {
  final restaurantRepository = Get.find<RestaurantInfra>();
  var popularRestaurants = <RestaurantData>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Delay to prevent 'No Overlay' error when showing snackbar on startup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchPopularRestaurants();
    });
  }

  Future<void> fetchPopularRestaurants() async {
    try {
      isLoading(true);
      final result = await restaurantRepository.getPopularRestaurants();
      popularRestaurants.assignAll(result);
    } catch (e) {
      // Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
