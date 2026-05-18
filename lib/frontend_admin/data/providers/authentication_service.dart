import 'package:dio/dio.dart';
import 'package:help_app_frontend/frontend_admin/data/infrastructure/authentication_infrastructure.dart';
import 'package:help_app_frontend/utils/key.dart';

class AuthenticationService implements IAuthenticationService {
  final Dio _dio;
  AuthenticationService({Dio? dio})
    : _dio = dio ?? Dio(BaseOptions(baseUrl: baseApiUrlV1));

  @override
  Future<String> LoginService(String userName, String password) async {
    if (userName.isEmpty || password.isEmpty) {
      return Future.error('Username and password cannot be empty');
    }
    var model = {'userName': userName, 'password': password};
    var data = await _dio.post('auth/login', data: model);
    if (data.statusCode == 200) {
      if (data.data['isSuccess']) {
        return data.data['data'];
      }
    }
    return "";
  }

  @override
  Future<bool> RegisterService(
    String userName,
    String password,
    int userType,
    String phone,
    String email,
  ) async {
    if (userName.isEmpty || password.isEmpty) {
      return Future.error('Username and password cannot be empty');
    }
    var model = {
      'userName': userName,
      'password': password,
      'userType': userType,
      'phone': phone,
      'email': email,
    };
    var data = await _dio.post('auth/register', data: model);
    if (data.statusCode == 200) {
      if (data.data['isSuccess']) {
        return data.data['data'];
      }
    }
    return false;
  }
}
