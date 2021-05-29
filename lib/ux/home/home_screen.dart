import 'package:flutter/material.dart';
import 'package:ghost12/domain/repository/chat_repository_interface.dart';
import 'package:ghost12/domain/repository/chats_repository_interface.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';
import 'package:ghost12/ux/home/home_block.dart';
import 'package:ghost12/ux/screens.dart';
import 'package:ghost12/ux/widgets/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeBlock(
        userRepository: context.read<UserRepository>(),
        localStorageRepository: context.read<LocalStorageRepository>(),
        chatsRepository: context.read<ChatsRepository>(),
      ),
      builder: (_, __) => HomeScreen._(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    final block = context.read<HomeBlock>()..initChats();
    await block.initChats();
  }

  @override
  Widget build(BuildContext context) {
    final block = context.watch<HomeBlock>();
    return Scaffold(
      appBar: AppBar(
        title: Text('GHOST'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: Color(0xff5c01b6),
        centerTitle: true,
      ),
      drawer: DrawerCustomer(
        name: block.name,
        phone: block.phone,
      ),
      body: Center(
        child: (block.chats.length > 0)
            ? ListView.separated(
                itemCount: block.chats.length, //dataBlock.chats.length,
                itemBuilder: (BuildContext context, int index) {
                  print('numero' + index.toString());
                  return GestureDetector(
                    onTap: () {
                      //messageBlock.chat = block.chats[index];
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (newContext) => MessageScreen.init(
                              context,
                              block.chats[index],
                              block.chats[index].users[0].phone),
                        ),
                      );
                    },
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
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    block.chats[index].users[0].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                  margin: EdgeInsets.only(right: 48),
                                ),
                                /* Text(
                                 dataBlock.chats[index].messages.length > 0
                                     ? dataBlock
                                         .chats[index]
                                         .messages[dataBlock
                                             .chats[index].messages.length]
                                         .message
                                     : "",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),*/
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: Colors.grey),
              )
            : Center(
                child: Text('Not chats'),
              ),
      ),
    );
  }
}
