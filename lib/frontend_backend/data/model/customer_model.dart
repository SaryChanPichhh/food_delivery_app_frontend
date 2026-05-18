class CustomerModel {
  final String userId;
  final String userName;
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  final String imageUrl;
  final String phone;
  final String address;
  final String role;
  final bool isActive;

  CustomerModel({
    required this.userId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.imageUrl,
    required this.phone,
    required this.address,
    required this.role,
    required this.isActive,
  });
}
