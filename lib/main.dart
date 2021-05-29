import 'package:flutter/material.dart';
import 'package:ghost12/data/respository/chat.repository_interface.dart';
import 'package:ghost12/data/respository/chats_repository_interface.dart';
import 'package:ghost12/data/respository/contact_repository_interface.dart';
import 'package:ghost12/data/respository/local_storage_interface.dart';
import 'package:ghost12/data/respository/message_repository_interface.dart';
import 'package:ghost12/data/respository/user_repository.interface.dart';
import 'package:ghost12/domain/repository/chat_repository_interface.dart';
import 'package:ghost12/domain/repository/chats_repository_interface.dart';
import 'package:ghost12/domain/repository/contact_repository_interface.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/message_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';
import 'package:ghost12/ux/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<LocalStorageRepository>(
            create: (_) => LocalStorageRepositoryImpl(),
          ),
          Provider<UserRepository>(
            create: (_) => UserRepositoryImpl(),
          ),
          Provider<MessageRepository>(
            create: (_) => MessageRepositoryImpl(),
          ),
          Provider<ChatRepository>(
            create: (_) => ChatRepositoryImpl(),
          ),
          Provider<ChatsRepository>(
            create: (_) => ChatsRepositoryImpl(),
          ),
          Provider<ContactRepository>(
            create: (_) => ContactRepositoryImpl(),
          ),
        ],
        child: Builder(
          builder: (newContext) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen.init(newContext),
            );
          },
        ));
  }
}
