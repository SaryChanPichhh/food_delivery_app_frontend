import 'package:flutter/material.dart';
import 'package:help_app_frontend/frontend_backend/data/model/coupon_assignment.model.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';

class CouponAssignCardComponent extends StatelessWidget {
  final CouponAssignmentModel assignment;
  const CouponAssignCardComponent({super.key, required this.assignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Assignment ID: #${assignment.assignmentId}',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: assignment.status == 'Active'
                        ? Colors.green.withOpacity(0.1)
                        : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    assignment.status,
                    style: TextStyle(
                      color: assignment.status == 'Active' ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.confirmation_number_outlined, size: 20, color: Colors.grey),
                const SizedBox(width: 10),
                Text(
                  'Coupon ID: ${assignment.couponId}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  assignment.assignmentType == 'Restaurant'
                      ? Icons.restaurant
                      : Icons.restaurant_menu,
                  size: 20,
                  color: Colors.grey,
                ),
                const SizedBox(width: 10),
                Text(
                  'Target: ${assignment.assignmentType}',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 10),
                Text(
                  'ID: ${assignment.assignmentType == 'Restaurant' ? assignment.restaurant_id : assignment.menuId}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            if (assignment.notes.isNotEmpty) ...[
              const Divider(height: 24),
              Text(
                'ចំណាំ៖ ${assignment.notes}',
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
