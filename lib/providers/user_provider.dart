import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:chat/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final _userRepository = UserRepository();

  bool _isLoading = false;
  AuthUser? _currentUser;

  bool get isLoading => _isLoading;
  AuthUser? get currentUser => _currentUser;

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Either<String, SignUpResult>> signUp(
      String username, String email, String password) async {
    _setIsLoading(true);
    final response = await _userRepository.signUp(username, email, password);
    _setIsLoading(false);
    return response;
  }

  Future<Either<String, bool>> confirmSignUp(
      {required String username, required String code}) async {
    _setIsLoading(true);
    final response = await _userRepository.confirmSignUp(
      username: username,
      code: code,
    );
    _setIsLoading(false);
    return response;
  }
}
