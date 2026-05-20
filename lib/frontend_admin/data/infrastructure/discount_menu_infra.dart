import 'package:help_app_frontend/frontend_admin/data/models/discount_menu_model.dart';

abstract class DiscountMenuInfra {
  Future<List<DiscountMenuData>> getDiscountedMenus();
}
