import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static PreferenciasUsuario _preferenciasUsuario = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _preferenciasUsuario;
  }

  PreferenciasUsuario._internal();


  SharedPreferences? _preferences;


  Future initPreferences()async{
    this._preferences = await SharedPreferences.getInstance();
  }

  //getter y setter


  String get nombreUsuario{
    return this._preferences!.getString("nombreUsuario") ?? "";
  }
  set nombreUsuario(String value){
    this._preferences!.setString("nombreUsuario", value);
  }
    

  int get generoUsuario{
    return this._preferences!.getInt("generoUsuario") ?? 2;
  }

  set generoUsuario(int value)
  {
    this._preferences!.setInt("generoUsuario", value);
  }

  bool get colorSecundario{
    return this._preferences!.getBool("colorSecundario") ?? false;
  }

  set colorSecundario(bool value){
    this._preferences!.setBool("colorSecundario", value);
  } 

  String get ultimaPagina{
    return this._preferences!.getString("ultimaPagina") ?? HomePage.routName;
  }

  set ultimaPagina(String value){
    this._preferences!.setString("ultimaPagina", value);
  }
}