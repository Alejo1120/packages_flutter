import 'package:flutter/material.dart';
import 'package:flutter_contact/contacts.dart';
import 'package:ghost12/data/response/chat_response.dart';
import 'package:ghost12/data/response/contact_response.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/chat_repository_interface.dart';
import 'package:ghost12/domain/repository/chats_repository_interface.dart';
import 'package:ghost12/domain/repository/contact_repository_interface.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';

class ContactBlock extends ChangeNotifier {
  late final LocalStorageRepository localStorageRepository;
  late final UserRepository userRepository;
  late final ChatsRepository chatsRepository;
  late final ContactRepository contactRepository;
  late List<ContactResponse> contacts = [];
  late ChatResponse chat;

  ContactBlock({
    required this.localStorageRepository,
    required this.userRepository,
    required this.chatsRepository,
    required this.contactRepository,
  });

  Future<bool?> initContacts() async {
    List<ContactResponse> listContact = [];
    var index = 0;
    await Contacts.streamContacts().forEach((contact) async {
      index = 0;
      contact.phones.forEach((element) async {
        if (index == 0 && element.value != null) {
          var numeroSplit = element.value!.split(" ").join("");
          if (numeroSplit[0] == "+" && numeroSplit[0] == "*") {
            var n = "";
            for (int i = 3; i < numeroSplit.length; i++) {
              n = n + numeroSplit[i];
            }
            numeroSplit = "";
            numeroSplit = n;
            print(numeroSplit);
          }
          final phone = await localStorageRepository.getPhone();
          if (phone != null && phone != 0) {
            if (numeroSplit.length == 10) {
              if (numeroSplit == phone.toString()) {
                print("iguallllllllllllll");
              } else {
                print(numeroSplit + '====' + phone.toString());
                ContactResponse contactRequestInterface = ContactResponse(
                    name: (contact.displayName != null)
                        ? contact.displayName!
                        : (contact.givenName != null)
                            ? contact.givenName!
                            : numeroSplit,
                    phone: int.parse(numeroSplit));
                listContact.add(contactRequestInterface);
                listContact.remove(phone);
                print('encontro');
              }
            } else {
              numeroSplit = "";
            }
          }

          index = 1;
        }
      });
    });
    try {
      if (listContact.length > 0) {
        this.contacts = [];
        final contatcsResponse = await contactRepository.getContacts();
        contatcsResponse.forEach((element) {
          listContact.forEach((element1) {
            if (element.phone == element1.phone) {
              print("telefono add" + element.toString());
              this.contacts.add(element);
            }
          });
        });
        notifyListeners();
      } else {
        this.contacts = [];
        notifyListeners();
      }
      return true;
    } on AuthExeption catch (_) {
      return false;
    }
  }

  Future<bool> getChat(int phone) async {
    List<ChatResponse> listChats;
    bool i = false;
    try {
      final user = await userRepository.getUserByPhone(phone);
      listChats = await chatsRepository.getChats(user.chats, "token");
      listChats.forEach((element) {
        if (element.users[0].id == user.id) {
          this.chat = element;
          i = true;
        }
      });
      if (i) {
        return true;
      } else {
        return false;
      }
    } on AuthExeption catch (_) {
      return false;
    }
  }
}
