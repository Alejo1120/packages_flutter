import 'package:ghost12/data/request/create_user_request.dart';
import 'package:ghost12/data/response/create_user_response.dart';
import 'package:ghost12/data/response/user_response.dart';
import 'package:ghost12/data/response/login_response.dart';
import 'package:ghost12/data/request/login_request.dart';
import 'package:ghost12/data/services/user_services.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';

class UserRepositoryImpl extends UserRepository {
  UserService _userService = UserService();
  @override
  Future<CreateUserResponse> createUser(CreateUserRequest user) async {
    CreateUserResponse userResponse;
    try {
      userResponse = await _userService.createUser(user);
      return userResponse;
    } on AuthExeption catch (_) {
      throw AuthExeption();
    }
  }

  @override
  Future<bool> deleteUser(String id, String token) async {
    return true;
  }

  @override
  Future<UserResponse> getUserById(String id, String token) async {
    UserResponse userResponse;
    try {
      userResponse = await _userService.getUserById(id, token);
      return userResponse;
    } on AuthExeption catch (_) {
      throw AuthExeption();
    }
  }

  @override
  Future<UserResponse> getUserByPhone(int phone) async {
    UserResponse userResponse;
    try {
      userResponse = await _userService.getUserByPhone(phone);
      return userResponse;
    } on AuthExeption catch (_) {
      throw AuthExeption();
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    LoginResponse loginResponse;
    try {
      loginResponse = await _userService.login(login);
      return loginResponse;
    } on AuthExeption catch (_) {
      throw AuthExeption();
    }
  }
}
