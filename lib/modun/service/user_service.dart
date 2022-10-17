import 'package:Flutter_father/modun/service/api_service.dart';
import '../../exercise/big_exercise/user.dart';

extension UserService on APIService {
  Future<User> login({
    required String phone,
    required String password,
  }) async {
    final body = {
      "phoneNumber": phone,
      "password": password,
    };
    final result = await request(
      path: '/api/accounts/login',
      body: body,
      method: Method.post,
    );
    final user = User.fromJson(result);
    return user;
  }
  Future<User> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final body = {
      "Name": name,
      "Email": email,
      "PhoneNumber": phone,
      "Password": password,
    };
    final result = await request(
      path: '/api/accounts/register',
      body: body,
      method: Method.post,
    );
    final user = User.fromJson(result);
    return user;
  }
}
