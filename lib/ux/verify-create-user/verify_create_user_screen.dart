import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';
import 'package:ghost12/ux/navigation.dart';
import 'package:ghost12/ux/screens.dart';
import 'package:ghost12/ux/verify-create-user/verify_create_user_block.dart';
import 'package:ghost12/ux/widgets/rounded_button.dart';
import 'package:ghost12/ux/widgets/rounded_input_field.dart';
import 'package:provider/provider.dart';

class VerifyCreateUser extends StatelessWidget {
  VerifyCreateUser._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VerifyCreateUserBlock(
        userRepository: context.read<UserRepository>(),
      ),
      builder: (_, __) => VerifyCreateUser._(),
    );
  }

  Future<bool?> validate(BuildContext context) async {
    final block = context.read<VerifyCreateUserBlock>();
    if (block.phoneController.text != '') {
      final validateResponse = await block.validatePhone();
      if (validateResponse) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('USUARIO EXISTENTE')));
        Future.delayed(const Duration(seconds: 2), () {
          pushAndReplaceToPage(context, LoginScreen.init(context));
        });
      } else {
        pushAndReplaceToPage(
            context,
            CreateUserScreen.init(
                context, int.parse(block.phoneController.text)));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('EL TELEFONO ES REQUERIDO')));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final block = context.watch<VerifyCreateUserBlock>();
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'VERIFICAR CUENTA',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5c01b6),
                      ),
                    ),
                    SizedBox(height: size.height * 0.08),
                    SvgPicture.asset(
                      'assets/images/ghost.svg',
                      height: size.height * 0.3,
                      color: Color(0xff5c01b6),
                    ),
                    SizedBox(height: size.height * 0.08),
                    RoundedInputField(
                      text: 'Telefono',
                      hinText: '311 111 1111',
                      height: 0.1,
                      keyboardType: TextInputType.phone,
                      icon: Icons.phone,
                      controller: block.phoneController,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: size.height * 0.03),
                    RoundedButton(
                      text: 'VERIFICAR',
                      fontSize: 0.03,
                      textColor: Colors.white,
                      color: Color(0xff5c01b6),
                      width: 0.8,
                      height: 0.08,
                      press: () => validate(context),
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
            child: (block.loginVerifyState == LoginVerifyState.loading
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
