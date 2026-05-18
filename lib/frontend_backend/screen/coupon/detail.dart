import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_backend/data/model/coupon_model.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';

class CouponDetailView extends StatelessWidget {
  const CouponDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final CouponModel coupon = Get.arguments as CouponModel;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'ព័ត៌មានគូប៉ុង',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(coupon),
            const SizedBox(height: 16),
            _buildInfoSection('ព័ត៌មានបញ្ចុះតម្លៃ', [
              _buildInfoTile(
                'ប្រភេទការបញ្ចុះតម្លៃ',
                coupon.discountType,
                Icons.category,
              ),
              _buildInfoTile(
                'តម្លៃបញ្ចុះ',
                coupon.discountType == 'Percentage'
                    ? '${coupon.discountValue.toInt()}%'
                    : '\$${coupon.discountValue}',
                Icons.monetization_on,
              ),
              _buildInfoTile(
                'ការកម្ម៉ង់អប្បបរមា',
                '\$${coupon.minOrderAmount}',
                Icons.shopping_bag,
              ),
            ]),
            _buildInfoSection('សុពលភាព និងការប្រើប្រាស់', [
              _buildInfoTile(
                'ថ្ងៃចាប់ផ្ដើម',
                coupon.startDate,
                Icons.calendar_today,
              ),
              _buildInfoTile('ថ្ងៃផុតកំណត់', coupon.endDate, Icons.event_busy),
              _buildInfoTile(
                'ចំនួនប្រើប្រាស់សរុប',
                '${coupon.usedCount} / ${coupon.maxUsage}',
                Icons.group,
              ),
            ]),
            _buildInfoSection('ព័ត៌មានប្រព័ន្ធ', [
              _buildInfoTile(
                'កាលបរិច្ឆេទបង្កើត',
                coupon.createdAt,
                Icons.access_time,
              ),
              _buildInfoTile(
                'កាលបរិច្ឆេទកែប្រែ',
                coupon.updatedAt,
                Icons.update,
              ),
            ]),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(CouponModel coupon) {
    bool isActive = coupon.status == 'Active';

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Text(
              coupon.code,
              style: TextStyle(
                color: primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            coupon.description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: isActive
                  ? Colors.greenAccent.withOpacity(0.2)
                  : Colors.redAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isActive ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
            child: Text(
              isActive ? 'សកម្ម' : coupon.status,
              style: TextStyle(
                color: isActive ? Colors.greenAccent : Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoTile(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[400]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
