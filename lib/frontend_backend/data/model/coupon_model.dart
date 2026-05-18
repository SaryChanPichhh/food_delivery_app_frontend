class CouponModel {
  final int couponId;
  final String code;
  final String createdAt;
  final String description;
  final String discountType; // e.g., 'Percentage' or 'Fixed Amount'
  final double discountValue;
  final String startDate;
  final String endDate;
  final int maxUsage;
  final double minOrderAmount;
  final String status; // e.g., 'Active', 'Expired', 'Disabled'
  final String updatedAt;
  final int usedCount;

  CouponModel({
    required this.couponId,
    required this.code,
    required this.createdAt,
    required this.description,
    required this.discountType,
    required this.discountValue,
    required this.startDate,
    required this.endDate,
    required this.maxUsage,
    required this.minOrderAmount,
    required this.status,
    required this.updatedAt,
    required this.usedCount,
  });
}
