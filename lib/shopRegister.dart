import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class shopRegister extends StatefulWidget {
  @override
  ShopRegisterApp createState() => ShopRegisterApp();
}

class ShopRegisterApp extends State<shopRegister> {
  @override
  TextEditingController nombreTienda = TextEditingController();
  TextEditingController rutaImagen = TextEditingController();
  TextEditingController descr_tienda = TextEditingController();
  TextEditingController webSite = TextEditingController();
  final firebase=FirebaseFirestore.instance;
  
  registrar() async{
    try{
      await firebase
          .collection('Tiendas')
          .doc()
          .set({
        'nombreTienda':nombreTienda.text,
        'ruta':rutaImagen.text,
        'descrip':descr_tienda.text,
        'webSite':webSite.text
      });
    }
    catch (e){
      print(e);
    }
  }
  
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                controller: nombreTienda,
                decoration: InputDecoration(
                    labelText: 'Nombre Tienda',
                    hintText: 'Digite el nombre de la tienda',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                controller: rutaImagen,
                decoration: InputDecoration(
                    labelText: 'Nombre Imagen',
                    hintText: 'Digite la ruta de la imagen',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                controller: descr_tienda,
                decoration: InputDecoration(
                    labelText: 'Descripción Tienda',
                    hintText: 'Digite la descripción de la Tienda',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                controller: webSite,
                decoration: InputDecoration(
                    labelText: 'Página Web',
                    hintText: 'Digite la página Web de la tienda',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: ElevatedButton(
                onPressed: (){
                 registrar();
                 nombreTienda.clear();
                 rutaImagen.clear();
                 descr_tienda.clear();
                 webSite.clear();
                },
                child: Text('Registrar'),
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
