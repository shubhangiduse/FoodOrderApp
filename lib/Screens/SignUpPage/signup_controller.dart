import 'package:flutter_assignment_shubhangi/Services/auth_service.dart';

class SignUpController {
  void createUser(String email, String password) {
    AuthService.registerUser(email, password);
  }
}
