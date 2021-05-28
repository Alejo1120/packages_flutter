import 'dart:convert';
import 'package:ghost12/data/request/create_user_request.dart';
import 'package:ghost12/data/request/login_request.dart';
import 'package:ghost12/data/response/create_user_response.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:http/http.dart' as http;

import 'package:ghost12/data/response/login_response.dart';
import 'package:ghost12/data/response/user_response.dart';

class UserService {
  final urlApi = 'https://ghost-back-end.herokuapp.com/users';

  Future<UserResponse> getUserByPhone(int phone) async {
    late UserResponse userResponseInterface;
    var url = Uri.parse('$urlApi/phone/$phone');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    http.Response response = await http.get(url, headers: headers);
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200 && responseJson['status'] == true) {
      userResponseInterface = UserResponse.fromJson(responseJson['user']);
      return userResponseInterface;
    }
    throw AuthExeption();
  }

  Future<UserResponse> getUserById(String id, String token) async {
    late UserResponse userResponseInterface;
    var url = Uri.parse('$urlApi/id/$id');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.get(url, headers: headers);
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200 && responseJson['status'] == true) {
      userResponseInterface = UserResponse.fromJson(responseJson['user']);
      return userResponseInterface;
    }
    throw AuthExeption();
  }

  Future<CreateUserResponse> createUser(CreateUserRequest user) async {
    late CreateUserResponse userResponseInterface;
    var url = Uri.parse('$urlApi/');
    var body = {
      'name': user.name,
      'description': user.description,
      'phone': user.phone,
      'password': user.password
    };
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    http.Response response = await http.post(url,
        body: JsonEncoder().convert(body), headers: headers);
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200 && responseJson['status'] == true) {
      userResponseInterface = CreateUserResponse.fromJson(responseJson['user']);
      return userResponseInterface;
    }
    throw AuthExeption();
  }

  Future<LoginResponse> login(LoginRequest login) async {
    late LoginResponse userResponseInterface;
    var url = Uri.parse('$urlApi/login');
    var body = {
      'phone': login.phone,
      'password': login.password,
    };
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    http.Response response = await http.post(url,
        body: JsonEncoder().convert(body), headers: headers);
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200 && responseJson['status'] == true) {
      userResponseInterface = LoginResponse.fromJson(responseJson['user']);
      return userResponseInterface;
    }
    throw AuthExeption();
  }

  Future<UserResponse> getUser(String id, String token) async {
    late UserResponse usersResponse;
    var url = Uri.parse('$urlApi/$id');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.get(url, headers: headers);
    var responseJson = jsonDecode(response.body);
    if (responseJson.statusCode == 200 && responseJson['status'] == true) {
      usersResponse = UserResponse.fromJson(responseJson['users']);
      return usersResponse;
    }
    throw AuthExeption();
  }
}
