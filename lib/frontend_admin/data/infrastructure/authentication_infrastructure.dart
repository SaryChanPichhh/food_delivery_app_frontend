abstract class IAuthenticationService {
  Future<String> LoginService(String userName, String password);
  Future<bool> RegisterService(
    String userName,
    String password,
    int userType,
    String phone,
    String email,
  );
}
