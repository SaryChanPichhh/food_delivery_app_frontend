import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_backend/datasource/menu.datasource.dart';
import 'package:help_app_frontend/frontend_backend/dto/respone/menu.res.dto.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:help_app_frontend/frontend_backend/widget/menu_card.component.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ViewMenu extends StatefulWidget {
  ViewMenu({super.key});

  @override
  State<ViewMenu> createState() => _ViewMenuState();
}

class _ViewMenuState extends State<ViewMenu> {
  late MenuDataSource menuDataSource;

  final List<MenuResponeDto> menus = [
    MenuResponeDto(
      id: '1',
      name: 'Burger',
      description: 'Delicious burger',
      image: '',
      price: '10',
      cateId: '1',
      resId: '1',
      cateName: "Snack",
      resName: "Res1",
    ),
    MenuResponeDto(
      id: '2',
      name: 'Pizza',
      description: 'Cheese pizza',
      image: '',
      price: '15',
      cateId: '2',
      resId: '1',
      cateName: "Snack",
      resName: "Res1",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menuDataSource = MenuDataSource(menus: menus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text(
          'មឺនុយ',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.adminMenuCrud);
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) => MenuCartComponent(menu: menus[index]),
      ),
    );
  }
}
