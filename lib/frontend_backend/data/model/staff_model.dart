class StaffModel {
  final String staffId;
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String position;
  final String department;
  final String imageUrl;
  final bool isActive;
  final String joinDate;

  StaffModel({
    required this.staffId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.position,
    required this.department,
    required this.imageUrl,
    required this.isActive,
    required this.joinDate,
  });
}
