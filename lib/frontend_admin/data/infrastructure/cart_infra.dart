import 'package:help_app_frontend/frontend_admin/data/models/cart_model.dart';

abstract class CartInfra {
  Future<List<CartData>> getCarts();
}
