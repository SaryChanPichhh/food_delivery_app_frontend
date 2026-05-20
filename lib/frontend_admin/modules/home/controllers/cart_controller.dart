import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/cart_infra.dart';
import 'package:help_app_frontend/frontend_admin/data/models/cart_model.dart';

class CartController extends GetxController {
  final cartRepository = Get.find<CartInfra>();
  var carts = <CartData>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Delay to prevent 'No Overlay' error when showing snackbar on startup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchCarts();
    });
  }

  Future<void> fetchCarts() async {
    try {
      isLoading(true);
      final result = await cartRepository.getCarts();
      carts.assignAll(result);
    } catch (e) {
      // Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
