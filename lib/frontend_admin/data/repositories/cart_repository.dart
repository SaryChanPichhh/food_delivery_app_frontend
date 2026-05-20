import 'package:help_app_frontend/frontend_admin/data/models/cart_model.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/cart_infra.dart';
import 'package:help_app_frontend/frontend_admin/data/providers/cart_provider.dart';

class CartRepository implements CartInfra {
  final provider = CartProvider();

  @override
  Future<List<CartData>> getCarts() async {
    return await provider.getCarts();
  }
}
