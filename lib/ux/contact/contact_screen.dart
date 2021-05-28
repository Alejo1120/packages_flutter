import 'package:flutter/material.dart';
import 'package:ghost12/data/response/chat_response.dart';
import 'package:ghost12/data/response/user_response.dart';
import 'package:ghost12/domain/repository/chats_repository_interface.dart';
import 'package:ghost12/domain/repository/contact_repository_interface.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';
import 'package:ghost12/ux/contact/contact_block.dart';
import 'package:ghost12/ux/screens.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactBlock(
        localStorageRepository: context.read<LocalStorageRepository>(),
        userRepository: context.read<UserRepository>(),
        chatsRepository: context.read<ChatsRepository>(),
        contactRepository: context.read<ContactRepository>(),
      )..initContacts(),
      builder: (_, __) => ContactScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final block = context.watch<ContactBlock>();
    return Scaffold(
      appBar: AppBar(
        title: Text('MIS CONTACTOS'),
        actions: [
          IconButton(
            onPressed: () {
              //showSearch(context: context, delegate: SearchContacts());
            },
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: Color(0xff5c01b6),
        centerTitle: true,
      ),

      // ignore: missing_required_param
      body: Center(
        child: (block.contacts.length > 0)
            ? ListView.separated(
                itemCount: block.contacts.length, //dataBlock.contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      final chatverify =
                          await block.getChat(block.contacts[index].phone);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (newContext) => MessageScreen.init(
                            context,
                            (chatverify)
                                ? block.chat
                                : ChatResponse(
                                    chatsId: '',
                                    type: true,
                                    users: [
                                      UserResponse(
                                          name: block.contacts[index].name,
                                          description: "description",
                                          phone: block.contacts[index].phone,
                                          status: false,
                                          chats: "",
                                          id: "")
                                    ],
                                    messages: [],
                                    id: ''),
                            block.contacts[index].phone,
                          ),
                        ),
                      );
                    }, //navegacion //navigatior
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Color(0xff5c01b6),
                            child: Image.network(
                              "https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-3-avatar-2754579_120516.png",
                              height: 56.0,
                            ),
                          ),
                          //Text(dataBlock.contacts[index].name),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: Colors.grey))
            : Center(
                child: Text('NO HAY CONTACTOS'),
              ),
      ),
    );
  }
}
