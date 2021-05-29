import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ghost12/data/request/message_request.dart';
import 'package:ghost12/data/response/message_response.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';

class MessageService {
  final urlApi = 'https://ghost-back-end.herokuapp.com/message';

  Future<MessageResponse> createMessage(
      MessageRequest message, String token) async {
    late MessageResponse messageResponseInterface;

    var url = Uri.parse('$urlApi/');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.post(url,
        headers: headers, body: JsonEncoder().convert(message));
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200 && responseJson['status'] == true) {
      messageResponseInterface =
          MessageResponse.fromJson(responseJson['message']);
      return messageResponseInterface;
    }
    throw AuthExeption();
  }
}
