class CouponAssignmentModel {
  final int assignmentId;
  final String assignmentType; // e.g., 'Menu Item', 'Restaurant'
  final String createdAt;
  final String notes;
  final String status;
  final String updatedAt;
  final int couponId;
  final int? menuId;
  final int? restaurant_id;

  CouponAssignmentModel({
    required this.assignmentId,
    required this.assignmentType,
    required this.createdAt,
    required this.notes,
    required this.status,
    required this.updatedAt,
    required this.couponId,
    this.menuId,
    this.restaurant_id,
  });
}
