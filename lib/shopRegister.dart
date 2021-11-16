import 'package:flutter/material.dart';

class shopRegister extends StatefulWidget {
  @override
  ShopRegisterApp createState() => ShopRegisterApp();
}

class ShopRegisterApp extends State<shopRegister> {
  @override
  Widget build(BuildContext context) {
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
        title: Text('Registro de Tiendas'),
        toolbarHeight: 50,
        elevation: 20.00,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Nombre Tienda',
                    hintText: 'Digite Nombre de la Tienda',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Nombre Imagen',
                    hintText: 'Digite la Ruta de la Imagen',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Descripcion Tienda',
                    hintText: 'Digite la Descripcion de la Tienda',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Pagina Web',
                    hintText: 'Digite Pagina Web de la Tienda',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
