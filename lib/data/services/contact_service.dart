import 'dart:convert';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:http/http.dart' as http;

import 'package:ghost12/data/response/contact_response.dart';

class ContactService {
  final urlApi = 'https://ghost-back-end.herokuapp.com/users';

  Future<List<ContactResponse>> getContact() async {
    late List<ContactResponse> contactsList;
    var url = Uri.parse('$urlApi');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    http.Response response = await http.get(url, headers: headers);
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200 && responseJson['status'] == true) {
      List<dynamic> contactsResponse = responseJson['users'];
      contactsList = contactsResponse
          .map((dynamic chat) => ContactResponse.fromJson(chat))
          .toList();
      return contactsList;
    }
    throw AuthExeption();
  }
}
