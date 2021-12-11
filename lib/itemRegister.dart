import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class itemRegister extends StatefulWidget {
  final String idTienda;
  itemRegister(this.idTienda);

  @override
  ItemRegisterApp createState() => ItemRegisterApp();
}
//
class ItemRegisterApp extends State<itemRegister> {
  @override
  TextEditingController nombre =TextEditingController();
  TextEditingController precio=TextEditingController();
  TextEditingController descripcion=TextEditingController();
  TextEditingController imagen = TextEditingController();


  final firebase=FirebaseFirestore.instance;

  registrarProducto() async{
    try{
      await firebase
          .collection("Productos")
          .doc()
          .set({
        "Nombre":nombre.text,
        "Precio":double.parse(precio.text),
        "Descripcion":descripcion.text,
        "TiendaId":widget.idTienda,
        'ruta':imagen.text,
        "Estado":true
      });
    }
    catch (e){
      print(e);
    }
  }

  Widget build(BuildContext context) {

    ///++++++++++++++++++++++++++++
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
          title: Text("Registro de Productos"),
          toolbarHeight: 50,
          elevation: 20.00,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left:15,top: 15,right: 15,bottom: 0),
                // NOMBRE USUARIO
                child: TextField(
                  controller: nombre,
                  decoration: InputDecoration(
                    labelText: "Nombre Producto",
                    hintText: "Digite nombre del producto",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:15,top: 15,right: 15,bottom: 0),
                // precio
                child: TextField(
                  controller: precio,
                  decoration: InputDecoration(
                      labelText: "Precio final",
                      hintText: "Digite precio",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:15,top: 15,right: 15,bottom: 0),
                // DESCRIPCIÓN TIENDA
                child: TextField(
                  controller: descripcion,
                  decoration: InputDecoration(
                      labelText: "Descripción",
                      hintText: "Digite Descripción del producto",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:15,top: 15,right: 15,bottom: 0),
                // RUTA IMÁMGEN
                child: TextField(
                  controller: imagen,
                  decoration: InputDecoration(
                      labelText: "Ruta de la imagen",
                      hintText: "Digite ruta",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),


              Padding(
                  padding: EdgeInsets.only(left:50,top: 20,right: 50,bottom: 20),
                  child: ElevatedButton(
                    onPressed: (){
                      registrarProducto();
                      nombre.clear();
                      precio.clear();
                      descripcion.clear();
                      imagen.clear();


                    },
                    child: Text("Registrar"),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(100,45),
                        primary: Colors.blue[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(600))),
                  )
              ),
            ],
          ),
        )

    );
  }
}