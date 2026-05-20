import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/discount_menu_infra.dart';
import 'package:help_app_frontend/frontend_admin/data/models/discount_menu_model.dart';

class DiscountMenuController extends GetxController {
  final repository = Get.find<DiscountMenuInfra>();
  var menus = <DiscountMenuData>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchDiscountedMenus();
    });
  }

  Future<void> fetchDiscountedMenus() async {
    try {
      isLoading(true);
      final result = await repository.getDiscountedMenus();
      menus.assignAll(result);
    } catch (e) {
      // Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
