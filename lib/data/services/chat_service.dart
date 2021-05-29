import 'dart:convert';
import 'package:ghost12/data/request/create_chat_request.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:http/http.dart' as http;

import 'package:ghost12/data/request/chat_request.dart';
import 'package:ghost12/data/response/chat_response.dart';

class ChatService {
  final urlApi = 'https://ghost-back-end.herokuapp.com/chat';

  Future<List<ChatResponse>> getChats(String id, String token) async {
    late List<ChatResponse> usersResponse;
    var url = Uri.parse('$urlApi/id/$id');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.get(url, headers: headers);
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200 && responseJson['status'] == true) {
      List<dynamic> chats = responseJson['salas']['chats'];
      usersResponse =
          chats.map((dynamic chat) => ChatResponse.fromJson(chat)).toList();
      return usersResponse;
    }
    throw AuthExeption();
  }

  Future<ChatResponse> getChat(String id, String token) async {
    late ChatResponse usersResponse;
    var url = Uri.parse('$urlApi/id/$id');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.get(url, headers: headers);
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200 && responseJson['status'] == true) {
      usersResponse = ChatResponse.fromJson(responseJson['chat']);
      return usersResponse;
    }
    throw AuthExeption();
  }

  Future<ChatResponse> createChat(CreateChatResquest chat, String token) async {
    late ChatResponse usersResponse;
    var url = Uri.parse('$urlApi/');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.post(url,
        body: JsonEncoder().convert(chat), headers: headers);
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200 && responseJson['status'] == true) {
      usersResponse = ChatResponse.fromJson(responseJson['chat']);
      return usersResponse;
    }
    throw AuthExeption();
  }
}
