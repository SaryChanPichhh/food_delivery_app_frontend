import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_backend/data/model/customer_model.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:help_app_frontend/frontend_backend/widget/user_card.component.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  // Dummy data for users
  final List<CustomerModel> users = [
    CustomerModel(
      userId: 'USER001',
      userName: 'chanpich',
      firstName: 'ចាន់',
      lastName: 'ពេជ្រ',
      password: 'password',
      email: 'chanpich@example.com',
      imageUrl: 'https://i.pravatar.cc/150?u=USER001',
      phone: '012 345 678',
      address: 'ភ្នំពេញ, កម្ពុជា',
      role: 'Customer',
      isActive: true,
    ),
    CustomerModel(
      userId: 'USER002',
      userName: 'sokha',
      firstName: 'សុក',
      lastName: 'ខា',
      password: 'password',
      email: 'sokha@example.com',
      imageUrl: 'https://i.pravatar.cc/150?u=USER002',
      phone: '098 765 432',
      address: 'សៀមរាប, កម្ពុជា',
      role: 'Customer',
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'គ្រប់គ្រងអតិថិជន',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          _buildSearchAndAdd(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserCardComponent(user: users[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndAdd() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ស្វែងរកអតិថិជន...',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.adminUserCrud),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
