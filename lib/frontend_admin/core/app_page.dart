import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/modules/home/bindings/home_binding.dart';
import 'package:help_app_frontend/frontend_admin/modules/splashScreen/controllers/splash_screen_controller.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_backend/screen/delivery/delivery_crud_entry.dart';
import 'package:help_app_frontend/frontend_backend/screen/coupon/assign_crud_entry.dart';
import 'package:help_app_frontend/frontend_backend/screen/coupon/assign_view.dart';
import 'package:help_app_frontend/frontend_backend/screen/delivery/detail.dart';
import 'package:help_app_frontend/frontend_backend/screen/delivery/view.dart';
import 'package:help_app_frontend/frontend_backend/screen/exchange/exchange_crud_entry.dart';
import 'package:help_app_frontend/frontend_backend/screen/exchange/view.dart';
import 'package:help_app_frontend/frontend_backend/screen/coupon/coupon_crud_entry.dart';
import 'package:help_app_frontend/frontend_backend/screen/coupon/detail.dart';
import 'package:help_app_frontend/frontend_backend/screen/coupon/view.dart';
import 'package:help_app_frontend/frontend_backend/screen/staff/staff_crud_entry.dart';
import 'package:help_app_frontend/frontend_backend/screen/staff/detail.dart';
import 'package:help_app_frontend/frontend_backend/screen/staff/view.dart';
import 'package:help_app_frontend/frontend_backend/screen/user/user_crud_entry.dart';
import 'package:help_app_frontend/frontend_backend/screen/user/detail.dart';
import 'package:help_app_frontend/frontend_backend/screen/user/view.dart';
import 'package:help_app_frontend/frontend_backend/modules/main/views/dashorad.dart';
import 'package:help_app_frontend/frontend_backend/modules/main/views/notification.dart';
import 'package:help_app_frontend/frontend_backend/screen/menus/menu_crud_entry.dart';
import 'package:help_app_frontend/frontend_backend/screen/menus/view.dart';
import 'package:help_app_frontend/frontend_backend/screen/restaurant/res_crud_entry.dart';
import 'package:help_app_frontend/frontend_backend/screen/restaurant/view.dart';
import 'package:help_app_frontend/onboarding_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/auth_screen.dart/forget_password_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/auth_screen.dart/login_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/auth_screen.dart/signup_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/account/profileAndAccount.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/cart/cart_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/discount/discount_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/food/food_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/grocery/grocery_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/delivery/delivery_register_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/delivery/driver_menu/driver_menu_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/home/views/access_address_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/home/views/menu_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/home/views/search_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/splashScreen/views/splash_screen.dart';

import '../modules/customer/account/account_screen.dart';
import '../modules/customer/cart/cart_detail_screen.dart';
import '../modules/customer/favorite/favortite_screen.dart';
import '../modules/supplier/supplier_menu_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: BindingsBuilder(() => Get.put(SplashController())),
    ),
    GetPage(name: AppRoutes.onBoarding, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),
    GetPage(name: AppRoutes.signup, page: () => SignUpScreen()),
    GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: AppRoutes.accessAddress, page: () => AccessAddressScreen()),
    GetPage(
      name: AppRoutes.menuBar,
      page: () => MenuScreen(),
      binding: HomeBinding(),
    ),
    GetPage(name: AppRoutes.food, page: () => FoodScreen()),
    GetPage(name: AppRoutes.search, page: () => SearchScreen()),
    GetPage(name: AppRoutes.grocery, page: () => GroceryScreen()),
    GetPage(name: AppRoutes.account, page: () => AccountScreen()),
    GetPage(name: AppRoutes.profile, page: () => ProfileAndAccountScreen()),
    GetPage(name: AppRoutes.favorite, page: () => FavortiteScreen()),
    GetPage(name: AppRoutes.cart, page: () => CartScreen()),
    GetPage(name: AppRoutes.cartDetail, page: () => CartDetailScreen()),
    GetPage(name: AppRoutes.discount, page: () => DiscountScreen()),
    // Driver
    GetPage(
      name: AppRoutes.deliverRegister,
      page: () => DeliveryRegisterScreen(),
    ),
    GetPage(name: AppRoutes.driverMenu, page: () => DriverMenuScreen()),

    // Supplier
    GetPage(name: AppRoutes.supplierMenu, page: () => SupplierMenuScreen()),

    // frontend_admin
    GetPage(name: AppRoutes.adminDashboard, page: () => AdminDashboard()),
    GetPage(name: AppRoutes.adminNotification, page: () => AdminNotification()),
    GetPage(name: AppRoutes.adminMenu, page: () => ViewMenu()),
    GetPage(name: AppRoutes.adminMenuCrud, page: () => MenuCrudEntry()),
    GetPage(name: AppRoutes.adminRes, page: () => RestaurantView()),
    GetPage(name: AppRoutes.adminResCrud, page: () => RestaurantCrudEntry()),
    GetPage(name: AppRoutes.adminDelivery, page: () => const DeliveryView()),
    GetPage(
      name: AppRoutes.adminDeliveryCrud,
      page: () => const DeliveryCrudEntry(),
    ),
    GetPage(
      name: AppRoutes.adminDeliveryDetail,
      page: () => const DeliveryDetailView(),
    ),
    GetPage(name: AppRoutes.adminUser, page: () => const UserView()),
    GetPage(name: AppRoutes.adminUserCrud, page: () => const UserCrudEntry()),
    GetPage(
      name: AppRoutes.adminUserDetail,
      page: () => const UserDetailView(),
    ),
    GetPage(name: AppRoutes.adminStaff, page: () => const StaffView()),
    GetPage(name: AppRoutes.adminStaffCrud, page: () => const StaffCrudEntry()),
    GetPage(
      name: AppRoutes.adminStaffDetail,
      page: () => const StaffDetailView(),
    ),
    GetPage(name: AppRoutes.adminCoupon, page: () => const CouponView()),
    GetPage(
      name: AppRoutes.adminCouponCrud,
      page: () => const CouponCrudEntry(),
    ),
    GetPage(
      name: AppRoutes.adminCouponDetail,
      page: () => const CouponDetailView(),
    ),
    GetPage(
      name: AppRoutes.adminCouponAssign,
      page: () => const CouponAssignView(),
    ),
    GetPage(
      name: AppRoutes.adminCouponAssignCrud,
      page: () => const CouponAssignCrudEntry(),
    ),
    GetPage(name: AppRoutes.adminExchange, page: () => const ExchangeView()),
    GetPage(
      name: AppRoutes.adminExchangeCrud,
      page: () => const ExchangeCrudEntry(),
    ),
  ];
}
