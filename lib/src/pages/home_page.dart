import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared_prefs/prefencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {

  static final String routName = "HomePage";
  final PreferenciasUsuario preferenciasUsuario = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

  preferenciasUsuario.ultimaPagina = HomePage.routName;

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: !preferenciasUsuario.colorSecundario ? Colors.blue: Colors.green,
        title: Text("Preferencias Usuario"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Color Secundario: ${preferenciasUsuario.colorSecundario}"),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            Text("Género: ${preferenciasUsuario.generoUsuario}"),
            Divider(
              color: Theme.of(context).primaryColor
            ),
            Text("Nombre Usuario: ${preferenciasUsuario.nombreUsuario}"),
            Divider(
              color: Theme.of(context).primaryColor
            ),
          ],
        ),
      ),
    );
  }
}