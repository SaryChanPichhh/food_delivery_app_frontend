import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_backend/data/model/coupon_assignment.model.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:help_app_frontend/frontend_backend/widget/coupon_assign_card.component.dart';

class CouponAssignView extends StatefulWidget {
  const CouponAssignView({super.key});

  @override
  State<CouponAssignView> createState() => _CouponAssignViewState();
}

class _CouponAssignViewState extends State<CouponAssignView> {
  // Dummy data for assignments
  final List<CouponAssignmentModel> assignments = [
    CouponAssignmentModel(
      assignmentId: 1,
      assignmentType: 'Restaurant',
      createdAt: '2024-05-13',
      notes: 'បញ្ចុះតម្លៃសម្រាប់ហាង Pizza Hut ទាំងអស់',
      status: 'Active',
      updatedAt: '2024-05-13',
      couponId: 1,
      restaurant_id: 101,
    ),
    CouponAssignmentModel(
      assignmentId: 2,
      assignmentType: 'Menu Item',
      createdAt: '2024-05-13',
      notes: 'បញ្ចុះតម្លៃសម្រាប់ម្ហូបប្រចាំខែ',
      status: 'Active',
      updatedAt: '2024-05-13',
      couponId: 2,
      menuId: 505,
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
          'ការផ្ដល់ប័ណ្ណបញ្ចុះតម្លៃ',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          _buildSearchAndAdd(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                return CouponAssignCardComponent(assignment: assignments[index]);
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
                hintText: 'ស្វែងរកការផ្ដល់ជូន...',
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
            onTap: () => Get.toNamed(AppRoutes.adminCouponAssignCrud),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.send_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
