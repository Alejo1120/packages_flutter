import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';
import 'package:ghost12/ux/navigation.dart';
import 'package:ghost12/ux/screens.dart';
import 'package:ghost12/ux/splash/splash_block.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen._();

  static Widget init(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => SplashBlock(
          localStorageRepository: context.read<LocalStorageRepository>(),
          userRepository: context.read<UserRepository>(),
        ),
        builder: (_, __) => SplashScreen._(),
      ),
    ]);
  }

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void _init() async {
    final splashBlock = context.read<SplashBlock>();
    final splashValidate = await splashBlock.validateSesion();
    if (splashValidate!) {
      pushToPage(context, HomeScreen.init(context));
    } else {
      pushToPage(context, LoginScreen.init(context));
    }
  }

  @override
  initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //pantalla del fantasmita
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff5c01b6),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //IMG CENTER

            children: [
              SvgPicture.asset(
                "assets/images/ghost.svg", //enrutramiento image
                color: Colors.white,
                height: size.height * 0.47, //ancho tamaño
              ),
              SizedBox(
                height: 90,
              ),
              Text(
                "GHOST",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.19, // tamano letra
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
