import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';
import 'package:preferencias_usuario/src/shared_prefs/prefencias_usuario.dart';

void main()async{
  final preferencias = new PreferenciasUsuario();
  WidgetsFlutterBinding.ensureInitialized();
  await preferencias.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final PreferenciasUsuario preferenciasUsuario = new PreferenciasUsuario();
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Preferencias práctica",
      initialRoute: preferenciasUsuario.ultimaPagina,
      routes: {
        HomePage.routName : (context)=> HomePage(),
        SettingsPage.routName : (context)=> SettingsPage(),
      },
    );

  }
}