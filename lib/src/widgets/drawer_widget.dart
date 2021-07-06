import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/menu-img.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Theme.of(context).primaryColor,),
            title: Text("Home"),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomePage.routName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.camera, color: Theme.of(context).primaryColor,),
            title: Text("Party Mode"),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.people, color: Theme.of(context).primaryColor,),
            title: Text("People"),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings, color: Theme.of(context).primaryColor,),
            title: Text("Settings"),
            onTap: (){
              Navigator.pushReplacementNamed(context, SettingsPage.routName);
            },
          )
        ],
      ),
    );
  }
}

