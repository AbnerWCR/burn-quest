import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService;

  LoginViewModel(this._authService);

  String _email = '';
  String _password = '';
  bool _isLoading = false;
  String? _errorMessage;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<bool> login() async {
    _setLoading(true);
    _errorMessage = null;

    final user = UserModel(email: _email, password: _password);
    final success = await _authService.login(user);

    if (!success) {
      _errorMessage = 'E-mail ou senha inválidos.';
    }

    _setLoading(false);
    return success;
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}