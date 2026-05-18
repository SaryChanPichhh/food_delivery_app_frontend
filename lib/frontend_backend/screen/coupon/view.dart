import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_backend/data/model/coupon_model.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:help_app_frontend/frontend_backend/widget/coupon_card.component.dart';

class CouponView extends StatefulWidget {
  const CouponView({super.key});

  @override
  State<CouponView> createState() => _CouponViewState();
}

class _CouponViewState extends State<CouponView> {
  // Dummy data for coupons
  final List<CouponModel> coupons = [
    CouponModel(
      couponId: 1,
      code: 'WELCOME50',
      createdAt: '2024-05-10',
      description: 'បញ្ចុះតម្លៃ ៥០% សម្រាប់ការកម្ម៉ង់ដំបូង',
      discountType: 'Percentage',
      discountValue: 50,
      startDate: '2024-05-10',
      endDate: '2024-12-31',
      maxUsage: 1000,
      minOrderAmount: 5.0,
      status: 'Active',
      updatedAt: '2024-05-10',
      usedCount: 156,
    ),
    CouponModel(
      couponId: 2,
      code: 'FOODLOVER',
      createdAt: '2024-05-12',
      description: 'បញ្ចុះតម្លៃ ៥ដុល្លារ សម្រាប់ការកម្ម៉ង់លើសពី ២០ដុល្លារ',
      discountType: 'Fixed Amount',
      discountValue: 5,
      startDate: '2024-05-12',
      endDate: '2024-06-12',
      maxUsage: 500,
      minOrderAmount: 20.0,
      status: 'Active',
      updatedAt: '2024-05-12',
      usedCount: 45,
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
          'គ្រប់គ្រងគូប៉ុង',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          _buildSearchAndAdd(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: coupons.length,
              itemBuilder: (context, index) {
                return CouponCardComponent(coupon: coupons[index]);
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
                hintText: 'ស្វែងរកគូប៉ុង...',
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
            onTap: () => Get.toNamed(AppRoutes.adminCouponCrud),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.add_box_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
