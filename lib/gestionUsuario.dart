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
            //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                EdgeInsets.only(bottom:20, top: 20, right: 50, left: 50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> registroUser()));
                },
                child: Text('Registro de Usuario'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(400,45),
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(top:10, bottom:20, right: 50, left: 50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => login()));
                },
                child:Text("Login"),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(400,45),
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(bottom:20, top: 10, right: 50, left: 50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => modificarUsuario()));
                },
                child: Text('Modificar Usuario'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(400,45),
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(bottom:20, top: 10, right: 50, left: 50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => cambioPass()));
                },
                child: Text('Cambio de Contrase??a'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(400,45),
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(bottom:20, top: 10, right: 50, left: 50),
              child: ElevatedButton(
                onPressed: (){
                  // Navigator.push(
                  //   context, MaterialPageRoute(builder: (_) => BajaUsuario()));
                  mensaje("Inactivar Usuario","??Desea inactivar al usuario?");
                },
                child: Text('Dar de baja'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(400,45),
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
                padding: EdgeInsets.only(left: 40, top: 10, right: 5, bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Correo',
                    hintText: 'Digite el correo',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, top: 10, right: 5, bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Contrase??a',
                    hintText: 'Digite Contrase??a',
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
