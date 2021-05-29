import 'package:flutter/material.dart';
import 'package:ghost12/ux/contact/contact_screen.dart';
import 'package:ghost12/ux/navigation.dart';

class DrawerCustomer extends StatefulWidget {
  final String name;
  final int phone;
  const DrawerCustomer({
    required this.name,
    required this.phone,
  });
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerCustomer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Drawer(
          elevation: 5,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff5c01b6),
                ),
                accountName: Text(widget.name),
                currentAccountPicture: Image.network(
                  "https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-3-avatar-2754579_120516.png",
                  height: 56.0,
                ),
                accountEmail: Text(widget.phone.toString()),
                otherAccountsPictures: [
                  IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.white,
                    iconSize: 35,
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              ListTile(
                title: Text(
                  'Mi perfil',
                  style: TextStyle(fontSize: size.height * 0.025),
                ),
                leading: Icon(Icons.account_circle_rounded),
                onTap: () {
                  //pushToPage(context, ProfileScreen());
                },
                selected: true,
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                title: Text(
                  'Mis Contactos',
                  style: TextStyle(fontSize: size.height * 0.025),
                ),
                leading: Icon(Icons.people_alt),
                onTap: () {
                  pushToPage(context, ContactScreen.init(context));
                },
                selected: true,
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                title: Text(
                  'Crear Grupo',
                  style: TextStyle(fontSize: size.height * 0.025),
                ),
                leading: Icon(Icons.maps_ugc_outlined),
                onTap: () {},
                selected: true,
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                title: Text(
                  'Ajustes',
                  style: TextStyle(fontSize: size.height * 0.025),
                ),
                leading: Icon(Icons.miscellaneous_services_sharp),
                onTap: () {},
                selected: true,
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                title: Text(
                  'Ayuda',
                  style: TextStyle(fontSize: size.height * 0.025),
                ),
                leading: Icon(Icons.help_outline_outlined),
                onTap: () {},
                selected: true,
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                title: Text(
                  'Eliminar Cuenta',
                  style: TextStyle(fontSize: size.height * 0.025),
                ),
                leading: Icon(Icons.delete_sharp),
                onTap: () {},
                selected: true,
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
