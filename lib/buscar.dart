import 'package:flutter/material.dart';

class buscar extends StatefulWidget{
  @override
  BuscarApp createState()=> BuscarApp();
}

class BuscarApp extends State<buscar>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.shade900, Colors.redAccent.shade400],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        title: Text('Registro de búsqueda'),
        toolbarHeight: 50,
        elevation: 20.00,
      ),
    );
  }
}