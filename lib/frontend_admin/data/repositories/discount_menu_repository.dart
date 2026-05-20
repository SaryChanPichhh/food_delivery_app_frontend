import 'package:help_app_frontend/frontend_admin/data/models/discount_menu_model.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/discount_menu_infra.dart';
import 'package:help_app_frontend/frontend_admin/data/providers/discount_menu_provider.dart';

class DiscountMenuRepository implements DiscountMenuInfra {
  final provider = DiscountMenuProvider();

  @override
  Future<List<DiscountMenuData>> getDiscountedMenus() async {
    return await provider.getDiscountedMenus();
  }
}
