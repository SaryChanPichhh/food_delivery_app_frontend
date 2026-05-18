import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/food/food_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/grocery/grocery_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/shop/shop_detail_screen.dart';
import 'package:help_app_frontend/utils/constraint.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../customer/account/account_screen.dart';
import '../../customer/cart/cart_screen.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );
  List<Widget> _buildScreens() {
    return [
      FoodScreen(),
      GroceryScreen(),
      ItemDetailScreen(),
      CartScreen(),
      AccountScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("អារហារ"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.local_grocery_store),
        title: ("គ្រឿងទេស"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("ស្វែងរក"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentGeometry.directional(0, 0),
          children: [
            Icon(FontAwesomeIcons.basketShopping, size: 20),
            Positioned(
              right: 0,
              top: 5,
              child: Text(
                '10',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
        title: ("កន្ត្រកទំនិញ"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("គណនី"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      decoration: NavBarDecoration(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 70,
      navBarStyle:
          NavBarStyle.neumorphic, // Choose the nav bar style with this property
    );
  }
}

// List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.home),
//       title: ("Home"),
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//       // scrollController: _scrollController1,
//       routeAndNavigatorSettings: RouteAndNavigatorSettings(
//         initialRoute: "/",
//         routes: {},
//       ),
//     ),
//   ];
// }
