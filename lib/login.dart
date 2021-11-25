import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../buscar.dart';
class login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

//
class LoginApp extends State<login> {
  TextEditingController correo = TextEditingController();
  TextEditingController pass = TextEditingController();
  //final firebase=FirebaseFirestore.instance;

  validarDatos() async {
    try {
      CollectionReference ref =
      FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        //print("flag");
        print(usuario.docs.length);
        int flag = 0;
        for (var cursor in usuario.docs) {
          print(cursor.get("correo")+ "||"+correo.text);

          if (cursor.get("correo") == correo.text) {
            print(cursor.get("password"));
            if (cursor.get("password") == pass.text) {
              mensaje("Correcto","Usuario correcto");
              print(cursor.get("nombreUsuario"));
              flag = 1;
              /*Navigator.push(
                  context, MaterialPageRoute(builder: (_) => buscar()));*/
            }
          }
        }
        print(flag);
        if (flag == 0) {
          mensaje("No encotrado","No se encontró el usuario");
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
        title: Text("Ingreso de clientes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right:10, top: 40, bottom: 10),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('image/login.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 5),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Correo',
                  hintText: 'Digite el correo',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 10, right: 40, bottom: 5),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Contraseña',
                  hintText: 'Digite su contraseña',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
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
                child: Text("Enviar"),

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
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              )
            ],
          );
        });
  }
}
