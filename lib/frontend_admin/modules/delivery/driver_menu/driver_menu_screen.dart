import 'package:flutter/material.dart';
import 'package:help_app_frontend/frontend_admin/modules/delivery/driver_menu/driver_dashboard/driver_dashboard_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/delivery/driver_menu/driver_home/driver_home_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/delivery/driver_menu/driver_map/driver_map_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/delivery/driver_menu/driver_profile/driver_profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../utils/constraint.dart';

class DriverMenuScreen extends StatelessWidget {
  DriverMenuScreen({super.key});
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );
  List<Widget> _screens() {
    return [
      DriverHomeScreen(),
      DriverMapScreen(),
      DriverDashobardScreen(),
      DriverProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("home"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.location_on_sharp),
        title: ("ផែនទី"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard),
        title: ("ផ្ទាំងគ្រប់គ្រង"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("គណនី"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens(),
      items: _navBarsItems(),
      decoration: NavBarDecoration(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 70,
      navBarStyle: NavBarStyle.neumorphic,
    );
  }
}
