import 'package:ghost12/data/response/contact_response.dart';
import 'package:ghost12/data/services/contact_service.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/contact_repository_interface.dart';

class ContactRepositoryImpl extends ContactRepository {
  ContactService _contactService = new ContactService();
  @override
  Future<List<ContactResponse>> getContacts() async {
    List<ContactResponse> listContacts;
    try {
      listContacts = await _contactService.getContact();
      return listContacts;
    } on AuthExeption catch (_) {
      throw AuthExeption();
    }
  }
}
