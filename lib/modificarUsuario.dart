import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class modificarUsuario extends StatefulWidget{
  @override
  ModificarUsuarioApp createState()=> ModificarUsuarioApp();
}

class ModificarUsuarioApp extends State<modificarUsuario> {

  TextEditingController correo= TextEditingController();
  TextEditingController nombreUsuario= TextEditingController();
  TextEditingController pass= TextEditingController();
  TextEditingController tel= TextEditingController();
  final firebase=FirebaseFirestore.instance;
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
          //print(cursor.get("Correo")+ "||"+correo.text);

          if (cursor.get("correo") == correo.text) {
            //print(cursor.get("Password"));
            if (cursor.get("password") == pass.text) {
              //mensaje("Correcto","Usuario correcto");
              //print(cursor.get("nombreUsuario"));
              flag = 1;
              print(cursor.id);
              try{
                await firebase
                    .collection('Usuarios')
                    .doc(cursor.id)
                    .set({
                  'nombreUsuario':nombreUsuario.text,
                  'correo':correo.text,
                  'telefono':tel.text,
                  'password':cursor.get('password'),
                  'estado':true
                });
              }catch(e){
                print (e);
              }
              //Navigator.push(
              //context, MaterialPageRoute(builder: (_) => buscar()));
            }
          }
        }
        //print(flag);
        if (flag == 0) {
          //mensaje("No encotrado","No se encontró el usuario");
        }
      } else {
        print("No hay elementos en la colección ");
      }
    } catch (e) {
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
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 5),
              child: TextField(
                obscureText: true,
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Contraseña',
                  hintText: 'Digite la Contraseña Actual',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 5),
              child: TextField(
                controller: nombreUsuario,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Nombre de Usuario',
                  hintText: 'Digite el Usuario Nuevo',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 5),
              child: TextField(
                controller: tel,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Telefono',
                  hintText: 'Digite el Telefono Nuevo',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 50),
                    primary: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(600))),
                onPressed: () {
                  validarDatos();
                  // correo.clear();
                  //pass.clear();
                },
                child: Text("Cambiar"),

              ),
            ),
          ],
        ),
      ),
    );
  }

}