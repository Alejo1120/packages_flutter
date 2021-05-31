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
    final _phone = await localStorageRepository.getPhone();
    await Contacts.streamContacts().forEach((contact) async {
      index = 0;
      contact.phones.forEach((element) async {
        if (index == 0 && element.value != null) {
          var numeroSplit = element.value!.split(" ").join("");
          var numeroS = numeroSplit.split("");
          if (numeroS[0] == "+" || numeroS[0] == "*") {
            var n = "";
            for (int i = 3; i < numeroS.length; i++) {
              n = n + numeroS[i];
            }
            numeroSplit = "";
            numeroSplit = n;
            print(n);
          }

          final phone = await localStorageRepository.getPhone();
          if (phone != null && phone != 0) {
            if (numeroSplit.split("").length == 10 &&
                numeroSplit != _phone.toString()) {
              if (listContact.length > 0) {
                var verify = false;
                for (int i = listContact.length; i == 0; i--) {
                  if (numeroSplit == listContact[i].phone.toString()) {
                    verify = true;
                  }
                }
                if (!verify) {
                  ContactResponse contactRequestInterface = ContactResponse(
                      name: (contact.displayName != null)
                          ? contact.displayName!
                          : (contact.givenName != null)
                              ? contact.givenName!
                              : numeroSplit,
                      phone: int.parse(numeroSplit));
                  listContact.add(contactRequestInterface);
                }
              } else {
                ContactResponse contactRequestInterface = ContactResponse(
                    name: (contact.displayName != null)
                        ? contact.displayName!
                        : (contact.givenName != null)
                            ? contact.givenName!
                            : numeroSplit,
                    phone: int.parse(numeroSplit));
                listContact.add(contactRequestInterface);
              }
            } else {}

            numeroSplit = "";
          }

          index = 1;
        }
      });
    });

    for (int i = 0; i < listContact.length; i++) {
      if (i == listContact.length) {
      } else {
        for (int j = (i + 1); j < listContact.length; j++) {
          if (listContact[i].phone == listContact[j].phone) {
            listContact.remove(listContact[i]);
          }
        }
      }
    }

    try {
      if (listContact.length > 0) {
        this.contacts = [];

        final contatcsResponse = await contactRepository.getContacts();
        contatcsResponse.forEach((element) {
          listContact.forEach((element1) {
            /*  print(element.phone.toString());
            print(element1.phone.toString()); */
            if (element.phone == element1.phone) {
              print(element.phone.toString());
              print(element1.phone.toString());
              this.contacts.add(element);
            }
          });
        });
        for (int i = 0; i < this.contacts.length; i++) {
          if (i == this.contacts.length) {
          } else {
            for (int j = (i + 1); j < this.contacts.length; j++) {
              if (this.contacts[i].phone == this.contacts[j].phone) {
                this.contacts.remove(this.contacts[i]);
              }
            }
          }
        }

        for (int i = 0; i < this.contacts.length; i++) {
          print(this.contacts[i].phone);
          print("my phone" + _phone.toString());
          if (this.contacts[i].phone == _phone) {
            this.contacts.remove(this.contacts[i]);
          }
        }
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
