import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_backend/data/model/staff_model.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:help_app_frontend/frontend_backend/widget/staff_card.component.dart';

class StaffView extends StatefulWidget {
  const StaffView({super.key});

  @override
  State<StaffView> createState() => _StaffViewState();
}

class _StaffViewState extends State<StaffView> {
  // Dummy data for staff
  final List<StaffModel> staffList = [
    StaffModel(
      staffId: 'STF001',
      userName: 'rathana',
      firstName: 'ស៊ន',
      lastName: 'រតនា',
      email: 'rathana@example.com',
      phone: '012 999 888',
      position: 'Admin Manager',
      department: 'Operations',
      imageUrl: 'https://i.pravatar.cc/150?u=STF001',
      isActive: true,
      joinDate: '2024-01-10',
    ),
    StaffModel(
      staffId: 'STF002',
      userName: 'visal',
      firstName: 'គឹម',
      lastName: 'វិសាល',
      email: 'visal@example.com',
      phone: '098 111 222',
      position: 'Content Moderator',
      department: 'Customer Service',
      imageUrl: 'https://i.pravatar.cc/150?u=STF002',
      isActive: true,
      joinDate: '2024-03-15',
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
          'គ្រប់គ្រងបុគ្គលិក',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          _buildSearchAndAdd(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: staffList.length,
              itemBuilder: (context, index) {
                return StaffCardComponent(staff: staffList[index]);
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
                hintText: 'ស្វែងរកបុគ្គលិក...',
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
            onTap: () => Get.toNamed(AppRoutes.adminStaffCrud),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.person_add_alt_1, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
