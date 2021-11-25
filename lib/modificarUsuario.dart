import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class modificarUsuario extends StatefulWidget{
  @override
  ModificarUsuarioApp createState()=> ModificarUsuarioApp();
}

class ModificarUsuarioApp extends State<modificarUsuario> {

  TextEditingController correo= TextEditingController();
  TextEditingController nombre= TextEditingController();
  TextEditingController telefono= TextEditingController();
  TextEditingController direccion= TextEditingController();
  final firebase=FirebaseFirestore.instance;
  String correo1 ="";
  String idDoc="";
  String pass="";
  bool estado=true;
  validarDatos() async {
    try {
      CollectionReference ref =
      FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        //print("flag");
        //print(usuario.docs.length);
        int flag = 0;
        for (var cursor in usuario.docs) {
          if (cursor.get("correo") == correo.text) {
            nombre.text=cursor.get("nombreUsuario");
            telefono.text=cursor.get("telefono");
            direccion.text=cursor.get("direccion");
            this.idDoc=cursor.id;
            this.correo1=cursor.get("correo");
            this.pass=cursor.get("password");

          }
        }
      } else {
        print("No hay elementos en la colección ");
      }
    } catch (e) {
      print(e);
    }
  }

  modificarDatos() async{
    try{
      await firebase
          .collection("Usuarios")
          .doc(idDoc)
          .set({
        "nombreUsuario":nombre.text,
        "Correo":this.correo1,
        "Telefono":telefono.text,
        "Password":pass,
        "Direccion":direccion.text,
        "Estado":estado
      });
    }
    catch (e){
      print(e);
    }
  }

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
        title: Text("Modificación de Usuario"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /*Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('image/login.png'),
                ),
              ),
            ),*/
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 5),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Correo',
                  hintText: 'Digite el Correo Actual',
                ),
              ),
            ),
            Padding(
                padding:
                EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: ElevatedButton(
                  onPressed: () {
                    validarDatos();

                  },
                  child: Text("Buscar Usuario"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue[600],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(600))),
                )),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 5),
              child: TextField(
                obscureText: true,
                controller: nombre,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Nombre',
                  hintText: 'Digite el Nombre de Usuario ',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 40, top: 15, right: 40, bottom: 5),
              child: TextField(
                controller: telefono,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Nombre de Usuario',
                  hintText: 'Digite el Usuario Nuevo',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 15, right: 40, bottom: 5),
              child: TextField(
                controller: direccion,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Dirección',
                  hintText: 'Digite la Dirección',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
                onPressed: () {
                  validarDatos();
                  // correo.clear();
                  //pass.clear();
                },
                child: Text("Modificar"),

              ),
            ),
          ],
        ),
      ),
    );
  }

}