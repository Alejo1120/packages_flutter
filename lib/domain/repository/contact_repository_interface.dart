import 'package:ghost12/data/response/contact_response.dart';

abstract class ContactRepository {
  Future<List<ContactResponse>> getContacts();
}
