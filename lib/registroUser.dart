import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class registroUser extends StatefulWidget {
  @override
  RegistroUserApp createState() => RegistroUserApp();
}

class RegistroUserApp extends State<registroUser> {
  @override
  TextEditingController nombreUser = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController tele = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController direccion = TextEditingController();
  final firebase=FirebaseFirestore.instance;

  registrarUsuario() async{
    try{
      await firebase
          .collection('Usuarios')
          .doc()
          .set({
        'nombreUsuario':nombreUser.text,
        'correo':correo.text,
        'telefono':tele.text,
        'password':pass.text,
        'direccion':direccion.text,
        'estado': true
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
        title: Text('Registro de Usuario'),
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
                controller: nombreUser,
                decoration: InputDecoration(
                    labelText: 'Nombre de usuario',
                    hintText: 'Digite el nombre del usuario',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                    labelText: 'Correo',
                    hintText: 'Digite el correo',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                controller: tele,
                decoration: InputDecoration(
                    labelText: 'Teléfono',
                    hintText: 'Digite el teléfono',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                controller: direccion,
                decoration: InputDecoration(
                    labelText: 'Dirección',
                    hintText: 'Digite la Dirección',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: TextField(
                obscureText: true,
                controller: pass,
                decoration: InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Digite la contraseña',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 0),
              child: ElevatedButton(
                onPressed: (){
                  registrarUsuario();
                  nombreUser.clear();
                  correo.clear();
                  tele.clear();
                  pass.clear();
                  direccion.clear();
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
