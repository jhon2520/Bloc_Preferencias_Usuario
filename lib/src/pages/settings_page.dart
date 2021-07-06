import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared_prefs/prefencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/drawer_widget.dart';

enum Valores { masculino, femenino,binario }

class SettingsPage extends StatefulWidget {
  static final String routName = "SettingsPage";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

//método para mostrar mensaje en el inicio de la página
void mostrarMensaje(BuildContext context) async{
  await Future.delayed(const Duration(milliseconds: 200));
  showDialog(context: context,
  builder: (context) {
    return AlertDialog(
      content: Text("Settings page",
      style: Theme.of(context).textTheme.headline4,
      ),
    );
  });
}

  TextEditingController? _controller;
  PreferenciasUsuario preferenciasUsuario = new PreferenciasUsuario();
  Valores? _valor;
  String? _nombre;
  int? _genero;
  bool? _colorSecundario;

  @override
  void initState() {
    this._nombre = preferenciasUsuario.nombreUsuario;
    this._genero = preferenciasUsuario.generoUsuario;
    this._colorSecundario = preferenciasUsuario.colorSecundario;
    preferenciasUsuario.ultimaPagina = SettingsPage.routName;
    iniciarValor(_genero!);
    _controller = new TextEditingController(text: _nombre);

    //método que da un callback cuando los widgets se han renderizado
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      
      mostrarMensaje(context);

    });

    super.initState();
  }

  iniciarValor(int genero)
  {
    switch(genero){
      case 0:
        _valor = Valores.masculino;
        break;
      case 1:
        _valor = Valores.femenino;
        break;
      case 2:
        _valor = Valores.binario;
        break;
    }

  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          backgroundColor: !preferenciasUsuario.colorSecundario ? Colors.blue: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Divider(),
              SwitchListTile(
                  tileColor: Colors.blue[50],
                  title: Text("Color secundario"),
                  subtitle: Text(
                    "Presione para cambiar el color",
                    style: TextStyle(fontSize: 10),
                  ),
                  value: _colorSecundario!,
                  onChanged: (bool value) {
                    setState(() {
                    _colorSecundario =value;
                    preferenciasUsuario.colorSecundario = value;
                    });
                  }),
              Divider(),
              RadioListTile(
                  title: Text("Masculino"),
                  subtitle: Text("¿Es usted un macho pecho peludo?"),
                  value: Valores.masculino,
                  groupValue: _valor,
                  onChanged: _cambiarSeleccion),
              RadioListTile(
                  title: Text("Femenino"),
                  subtitle: Text("¿Llora usted con el final de Dragon Ball?"),
                  value: Valores.femenino,
                  groupValue: _valor,
                  onChanged: _cambiarSeleccion),
              RadioListTile(
                  title: Text("Binario"),
                  subtitle: Text("¿Se cree usted un helicoptero apache?"),
                  value: Valores.binario,
                  groupValue: _valor,
                  onChanged: _cambiarSeleccion),
         
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  onChanged: (String value) {
                    preferenciasUsuario.nombreUsuario = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Nombre",
                      helperText: "Nombre del dueño del celular"),
                  controller: _controller,
                ),
              )
            ],
          ),
        ));
  }

  void _cambiarSeleccion(Valores? value) {
    setState(() {
    this._genero = value!.index;
    //print("Genero: $_genero");
    preferenciasUsuario.generoUsuario = this._genero!;
    //print("Preferencias2: ${preferenciasUsuario.generoUsuario}");
    _valor = value;
    //print("Valor: $_valor");
    });
  }
}
