import 'package:ghost12/data/request/create_user_request.dart';
import 'package:ghost12/data/request/login_request.dart';
import 'package:ghost12/data/response/create_user_response.dart';
import 'package:ghost12/data/response/login_response.dart';
import 'package:ghost12/data/response/user_response.dart';

abstract class UserRepository {
  Future<UserResponse> getUserById(String id, String token);
  Future<UserResponse> getUserByPhone(int phone);
  Future<CreateUserResponse> createUser(CreateUserRequest user);
  Future<bool> deleteUser(String id, String token);
  Future<LoginResponse> login(LoginRequest login);
}
