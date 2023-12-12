import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  User? get userProfile => auth.currentUser;
  String get uid => userProfile != null ? userProfile!.uid : "";
  String? get displayUserName => userProfile != null ? userProfile!.displayName : "";

  static void registerUser(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      print('Exception in registerUser() : ${e.toString()}');
    }
  }

  static Future<bool> loginUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on Exception catch (e) {
      print('Exception in loginUserUser() : ${e.toString()}');
      return false;
    }
  }

  static void signOut() {
    auth.signOut();
  }
}
