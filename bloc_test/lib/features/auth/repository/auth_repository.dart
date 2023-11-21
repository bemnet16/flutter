import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data_provider/auth_data_provider.dart';
import '../model/user_model.dart';

class AuthRepository {
  final AuthDataProvider authProvider;
  AuthRepository(this.authProvider);

  Future<Map<String, dynamic>> login(email, password) async {
    return await authProvider.loginUser(email, password);
  }

  Future<User> signup(User user) async {
    return await authProvider.signupUser(user);
  }

  Future<void> storeToken(String token, User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('user', json.encode(user.toJson()));
  }

  Future<Map> retrieveToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final userJson = prefs.getString('user');
    if (userJson != null) {
      final user = User.fromJson(json.decode(userJson));
      return {"user": user, "token": token};
    }
    return {};
  }
}
