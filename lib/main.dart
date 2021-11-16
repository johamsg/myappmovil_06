import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myappmovil_06/buscar.dart';
import 'shop.dart';
import 'shopRegister.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();

}
@override
class HomeStart extends State<Home>{
  @override
Widget build(BuildContext context) {

    return MaterialApp(
      title: 'App',
      home: Scaffold(
        //extendBodyBehindAppBar: true,
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
          title: Text('Find My Commerce'),
          titleSpacing: 0.0,
          centerTitle: true,
          toolbarHeight: 50,
          elevation: 20.00,
          // ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset('image/find my commerce.png'),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(600),
                      ),
                      //icon: Icon(Icons.search),
                      labelText: 'búsqueda',
                      hintText: 'Palabra clave de la búsqueda'),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: ElevatedButton(
                  onPressed: () {
                    print("presionado");
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => buscar()));
                  },
                  child: Text('Buscar'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(600))),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: ElevatedButton(
                  onPressed: () {
                    //print("presionado");
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => shop()));
                  },
                  child: Text('Listado de tiendas'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue[600],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(600))),

             /*Builder(
                builder: (context) => ElevatedButton(
                  //EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => buscar()));
                  },
                  child: Text('Buscar'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red[600],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(600))),*/
                ),
              ),
        Padding(
          padding:
          EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
          child: ElevatedButton(
            onPressed: () {
              //print("presionado");
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => shopRegister()));
            },
            child: Text('Registro de tiendas'),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue[600],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(600))),
          ),
        ),
            ],
          ),
        ),
      ),
    );
  }
}

