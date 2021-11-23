import 'package:flutter/material.dart';
import 'package:myappmovil_06/modificarUsuario.dart';
import 'registroUser.dart';
import 'login.dart';
import 'cambioPass.dart';
import 'bajaUsuario.dart';

class gestionUsuario extends StatefulWidget{
  @override
  GestionUsuarioApp createState()=> GestionUsuarioApp();
}

class GestionUsuarioApp extends State<gestionUsuario>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blue.shade600],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        title: Text('Gestion Usuario'),
        toolbarHeight: 50,
        elevation: 20.00,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                EdgeInsets.only(bottom:5, top: 5, right: 70),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> registroUser()));
                },
                child: Text('Registro de Usuario'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(top:5, bottom:5),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => login()));
                },
                child:Text("Login"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(bottom:5, top: 5),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => modificarUsuario()));
                },
                child: Text('Modificar Usuario'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(bottom:5, top: 5),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => cambioPass()));
                },
                child: Text('Cambio de Contraseña'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(bottom:5, top: 5),
              child: ElevatedButton(
                onPressed: (){
                  // Navigator.push(
                  //   context, MaterialPageRoute(builder: (_) => BajaUsuario()));
                  mensaje("Inactivar Usuario","¿Desea inactivar al usuario?");
                },
                child: Text('Dar de baja'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void mensaje(String titulo, String mess) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
                child: TextField(
                  // controller: correo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Correo',
                    hintText: 'Digite el correo',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
                child: TextField(
                  // controller: correo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Contraseña',
                    hintText: 'Digite Contraseña',
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                Text("Cancelar", style: TextStyle(color: Colors.blueGrey)),

              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              ),

            ],
          );
        });
  }
}
