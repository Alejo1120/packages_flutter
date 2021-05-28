import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';
import 'package:ghost12/provaider/data_block.dart';
import 'package:ghost12/ux/login/login_block.dart';
import 'package:ghost12/ux/navigation.dart';
import 'package:ghost12/ux/screens.dart';
import 'package:ghost12/ux/widgets/rounded_button.dart';
import 'package:ghost12/ux/widgets/rounded_input_field.dart';
import 'package:ghost12/ux/widgets/rounded_password_field.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginBlock(
        localStorageRepository: context.read<LocalStorageRepository>(),
        userRepository: context.read<UserRepository>(),
      ),
      builder: (_, __) => LoginScreen._(),
    );
  }

  Future<bool?> login(BuildContext context) async {
    final block = context.read<LoginBlock>();
    if (block.phoneController.text != '' &&
        block.contrasenaController.text != '') {
      await Permission.contacts.request();
      var status = await Permission.contacts.status;
      if (status.isGranted) {
        final loginResponse = await block.login();
        if (loginResponse!) {
          pushToPage(context, HomeScreen.init(context));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('LOGIN INCORRECTO')));
        }
      } else if (status.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('LOS PERMISOS SON REQUERIDOS')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('LOS CAMPOS SON REQUERIDOS')));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final block = context.watch<LoginBlock>();

    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'GHOST',
                    style: TextStyle(
                      fontSize: size.width * 0.15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff5c01b6),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  SvgPicture.asset(
                    'assets/images/ghost.svg',
                    height: size.height * 0.2,
                    color: Color(0xff5c01b6),
                  ),
                  SizedBox(height: size.height * 0.06),
                  RoundedInputField(
                    text: 'Telefono',
                    hinText: '311 111 1111',
                    height: 0.1,
                    keyboardType: TextInputType.phone,
                    icon: Icons.phone,
                    controller: block.phoneController,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: size.height * 0.0002),
                  RoundedPasswordField(
                    text: 'Contrasena',
                    controller: block.contrasenaController,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: size.height * 0.02),
                  RoundedButton(
                    text: 'INGRESAR',
                    textColor: Colors.white,
                    color: Color(0xff5c01b6),
                    width: 0.8,
                    height: 0.08,
                    fontSize: 0.04,
                    press: () => login(context),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: size.width * 0.06),
                        child: Text(
                          'Si no tienes una cuenta',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            pushToPage(context, VerifyCreateUser.init(context)),
                        child: Text(
                          'Crear cuenta',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5c01b6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: (block.loginState == LoginState.loading
              ? Container(
                  color: Colors.black26,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SizedBox.shrink()),
        ),
      ],
    ));
  }
}
