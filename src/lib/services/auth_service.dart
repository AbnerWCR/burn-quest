import '../models/user_model.dart';

class AuthService {
  
  Future<bool> login(UserModel user) async {
    await Future.delayed(const Duration(seconds: 2));
    
    if (user.email.contains('@') && user.password.length >= 6) {
      return true;
    } else {
      return false;
    }
  }
}