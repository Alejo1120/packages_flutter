import 'package:flutter/material.dart';
import 'package:ghost12/domain/repository/chat_repository_interface.dart';
import 'package:ghost12/domain/repository/contact_repository_interface.dart';
import 'package:ghost12/provaider/data_block.dart';
import 'package:ghost12/ux/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class DataSplash extends StatelessWidget {
  DataSplash._();

  static Widget init(BuildContext context) {
    return DataSplash._();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen.init(context);
  }
}
