import 'package:flutter/material.dart';
import 'shopRegister.dart';
import 'shop.dart';
import '../buscar.dart';

class gestionTiendas extends StatefulWidget{
  @override
  GestionTiendasApp createState()=> GestionTiendasApp();
}

class GestionTiendasApp extends State<gestionTiendas>{
  TextEditingController busqueda=TextEditingController();
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
        title: Text('Gestión de Tiendas'),
        toolbarHeight: 50,
        elevation: 20.00,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, right: 20, left: 20),
              child: TextField(
                controller: busqueda,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Buscar tienda',
                  hintText: 'Digite palabra clave de la tienda',
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(bottom:5, top: 15),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => buscar(busqueda.text)));
                },
                child: Text('Buscar'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100,45),
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),

            Padding(
              padding:
              EdgeInsets.only(bottom:20, top: 30, right: 50, left: 50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => shopRegister()));
                },
                child: Text('Registro Tienda'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200,45),
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(bottom:20, top: 0, right: 50, left: 50),
              child: ElevatedButton(
                onPressed: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (_) => shopRegister()));
                },
                child: Text('Modificar Tienda'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200,45),
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
              ),
            ),
      Padding(
        padding:
        EdgeInsets.only(bottom:20, top: 0, right: 50, left: 50),
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => shop()));
          },
          child: Text('Listado de Tiendas'),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(200,45),
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