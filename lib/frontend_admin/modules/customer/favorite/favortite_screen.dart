import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/favorite/favorites_restuarant_screen.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/shop/shop_detail_screen.dart';
import 'package:help_app_frontend/utils/constraint.dart';

class FavortiteScreen extends StatefulWidget {
  FavortiteScreen({super.key});

  @override
  State<FavortiteScreen> createState() => _FavortiteScreenState();
}

class _FavortiteScreenState extends State<FavortiteScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<TabData> tabs = [];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  void _goToTab(int index) {
    // ✅ Change tab programmatically
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back),
            ),
            SizedBox(width: 20),
            Text('សំណព្វចិត្ត'),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "ភោជនីយដ្ខាន"),
            Tab(text: "ហាងទំនិញ"),
          ],
          indicatorColor: primaryColor,
          indicatorWeight: 4,
          labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: "KhmerOSContent",
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),

      body: TabBarView(
        controller: _tabController,
        children: [FavoritesRestuarantScreen(), ItemDetailScreen()],
      ),
    );
  }
}
