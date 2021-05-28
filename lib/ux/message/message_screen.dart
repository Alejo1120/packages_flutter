import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghost12/data/response/chat_response.dart';
import 'package:ghost12/domain/repository/chat_repository_interface.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/message_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';
import 'package:ghost12/ux/message/message_block.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen._();

  static Widget init(BuildContext context, ChatResponse chat, int phone) {
    return ChangeNotifierProvider(
      create: (_) => MessageBlock(
        localStorageRepository: context.read<LocalStorageRepository>(),
        userRepository: context.read<UserRepository>(),
        chatRepository: context.read<ChatRepository>(),
        messageRepository: context.read<MessageRepository>(),
      )
        ..initChat(chat)
        ..phone = phone,
      builder: (_, __) => MessageScreen._(),
    );
  }

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final block = context.watch<MessageBlock>();

    return Stack(
      children: [
        Image.asset(
          "assets/images/whatsapp_Back.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    CircleAvatar(
                      child: SvgPicture.asset(
                        'assets/images/ghost.svg',
                        color: Colors.white,
                        height: 36,
                        width: 36,
                      ),
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        block.chat.users[0].name,
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "last seen today at 12:05",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
                IconButton(icon: Icon(Icons.call), onPressed: () {}),
                PopupMenuButton<String>(
                  padding: EdgeInsets.all(0),
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext contesxt) {
                    return [
                      PopupMenuItem(
                        child: Text("View Contact"),
                        value: "View Contact",
                      ),
                      PopupMenuItem(
                        child: Text("Media, links, and docs"),
                        value: "Media, links, and docs",
                      ),
                      PopupMenuItem(
                        child: Text("Whatsapp Web"),
                        value: "Whatsapp Web",
                      ),
                      PopupMenuItem(
                        child: Text("Search"),
                        value: "Search",
                      ),
                      PopupMenuItem(
                        child: Text("Mute Notification"),
                        value: "Mute Notification",
                      ),
                      PopupMenuItem(
                        child: Text("Wallpaper"),
                        value: "Wallpaper",
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              onWillPop: () {
                Navigator.pop(context);
                return Future.value(false);
              },
              child: Column(
                children: [
                  Expanded(
                    // height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                      itemCount: block.chat.messages.length,
                      itemBuilder: (context, index) {
                        if (index == block.chat.messages.length) {
                          return Container(
                            height: 70,
                          );
                        }
                        if (block.chat.messages[index].message != block.user) {
                          return OwnMessageCard(
                            message: block.chat.messages[index].message,
                            time: block.chat.messages[index].time,
                          );
                        } else {
                          return ReplyCard(
                            message: block.chat.messages[index].message,
                            time: block.chat.messages[index].time,
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: block.messageController,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: IconButton(
                                        icon: Icon(
                                          Icons.emoji_emotions_outlined,
                                        ),
                                        onPressed: () {
                                          // if (!show) {
                                          //   focusNode.unfocus();
                                          //   focusNode.canRequestFocus = false;
                                          // }
                                          // setState(() {
                                          //   show = !show;
                                          // });
                                        },
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.attach_file),
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.camera_alt),
                                            onPressed: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (builder) =>
                                              //             CameraApp()));
                                            },
                                          ),
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.all(5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  right: 2,
                                  left: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xFF128C7E),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (block.messageController.text.length >
                                          0) {
                                        if (block.chat.messages.length > 0) {
                                          block.addMessage();
                                        } else {
                                          block.createChat();
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //       show ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _messageLayoud(
    BuildContext context, {
    text,
    time,
    color,
    align,
    nip,
    boxAlign,
    crossAlign,
  }) {
    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.90,
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(3),
            child: Bubble(
                color: color,
                nip: nip,
                child: Column(
                  crossAxisAlignment: crossAlign,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text,
                      textAlign: align,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      time,
                      textAlign: align,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(.4),
                      ),
                    )
                  ],
                )),
          ),
        )
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }
}

class ReplyCard extends StatelessWidget {
  const ReplyCard({required this.message, required this.time});
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 50,
                  top: 5,
                  bottom: 10,
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({required this.message, required this.time});
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 30,
                  top: 5,
                  bottom: 20,
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
