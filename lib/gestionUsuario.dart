import 'package:flutter/material.dart';
import 'registroUser.dart';

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
      body: Padding(
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
              EdgeInsets.only(bottom:5, top: 5),
              child: ElevatedButton(
                onPressed: (){},
                child: Text('Login'),
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
                onPressed: (){},
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
                onPressed: (){},
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
                onPressed: (){},
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
}