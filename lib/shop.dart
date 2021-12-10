import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myappmovil_06/shopView.dart';
import 'package:myappmovil_06/tienda.dart';
import 'shopView.dart';

class shop extends StatefulWidget {
  @override
  ShopApp createState() => ShopApp();
}

class ShopApp extends State<shop> {
  tienda tiendaObjeto=new tienda();

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
        title: Text('Lista de Tiendas'),
        /*titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 20.00,*/
      ),
      body: Container(
        child: Center(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Tiendas').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(snapshot.data!.docs[index]
                                        .get('nombreTienda')),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index].get("descrip"),
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                ],
                              )),
                              Container(
                                width: 80,
                                height: 80,
                                child: Image.asset('image/' +
                                    snapshot.data!.docs[index].get("ruta")),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  tiendaObjeto.idTienda=snapshot.data!.docs[index].id;
                                  tiendaObjeto.nombre=snapshot.data!.docs[index].get("nombreTienda");
                                  tiendaObjeto.descripcion=snapshot.data!.docs[index].get("descrip");
                                  tiendaObjeto.imagen=snapshot.data!.docs[index].get("ruta");
                                  tiendaObjeto.website=snapshot.data!.docs[index].get("webSite");
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => shopView(tiendaObjeto)));
                                },
                                child: Text('Entrar'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue[600],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(600))),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
