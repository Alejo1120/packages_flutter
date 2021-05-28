import 'dart:convert';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:http/http.dart' as http;

import 'package:ghost12/data/response/chat_response.dart';

class ChatsService {
  final urlApi = 'https://ghost-back-end.herokuapp.com/chats';

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
}
