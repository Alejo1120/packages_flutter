import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';
import 'package:ghost12/provaider/data_block.dart';
import 'package:ghost12/ux/create-user/create_user_block.dart';
import 'package:ghost12/ux/navigation.dart';
import 'package:ghost12/ux/screens.dart';
import 'package:ghost12/ux/widgets/rounded_button.dart';
import 'package:ghost12/ux/widgets/rounded_input_field.dart';
import 'package:ghost12/ux/widgets/rounded_password_field.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateUserScreen extends StatelessWidget {
  CreateUserScreen._();

  static Widget init(BuildContext context, int phone) {
    return ChangeNotifierProvider(
      create: (_) => CreateUserBlock(
        localStorageRepository: context.read<LocalStorageRepository>(),
        userRepository: context.read<UserRepository>(),
        phone: phone,
      ),
      builder: (_, __) => CreateUserScreen._(),
    );
  }

  void createUser(BuildContext context) async {
    final block = context.read<CreateUserBlock>();
    if (block.nameController.text != "" &&
        block.contrasenaController.text != "" &&
        block.verifyContrasenaController.text != "") {
      if (block.contrasenaController.text ==
          block.verifyContrasenaController.text) {
        await Permission.contacts.request();
        var status = await Permission.contacts.status;
        if (status.isGranted) {
          final createUserResponse = await block.createUser();
          if (createUserResponse) {
            pushAndReplaceToPage(context, HomeScreen.init(context));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('ERROR AL CREAR LA CUENTA')));
          }
        } else if (status.isDenied) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('LOS PERMISOS SON REQUERIDOS')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('LAS CONTRASENAS NO COINCIDEN')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final block = context.watch<CreateUserBlock>();
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'GHOST',
                      style: TextStyle(
                        fontSize: size.width * 0.14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5c01b6),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    SvgPicture.asset(
                      'assets/images/ghost.svg',
                      height: size.height * 0.19,
                      color: Color(0xff5c01b6),
                    ),
                    SizedBox(height: size.height * 0.06),
                    RoundedInputField(
                      text: 'Nombre',
                      hinText: 'Juan selen',
                      height: 0.1,
                      keyboardType: TextInputType.text,
                      icon: Icons.person,
                      controller: block.nameController,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: size.height * 0.001),
                    RoundedPasswordField(
                      text: 'Contrasena',
                      controller: block.contrasenaController,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: size.height * 0.001),
                    RoundedPasswordField(
                      text: 'Verificar Contrasena',
                      controller: block.verifyContrasenaController,
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
                      press: () => createUser(context),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: size.width * 0.06),
                          child: Text(
                            'Si tienes una cuenta',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => pushAndReplaceToPage(
                              context, LoginScreen.init(context)),
                          child: Text(
                            'Iniciar Sesion',
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
      ),
    );
  }
}
