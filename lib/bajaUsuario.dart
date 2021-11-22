import 'package:flutter/material.dart';

class bajaUsuario extends StatefulWidget{
  @override
  BajaUsuarioApp createState()=> BajaUsuarioApp();
}

class BajaUsuarioApp extends State<bajaUsuario>{
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
        title: Text('Inactivar'),
        toolbarHeight: 50,
        elevation: 20.00,
      ),
    );
  }
}