import 'package:flutter_assignment_shubhangi/Services/auth_service.dart';

class LogInController {
  Future<bool> logInUser(String email, String password) async {
    bool isValidUser = await AuthService.loginUser(email, password);
    return isValidUser;
  }
}
