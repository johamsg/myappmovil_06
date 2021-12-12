import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'carrito.dart';

class shoppingCart extends StatefulWidget {
  final String idUser;
  shoppingCart(this.idUser);
  @override
  ShoppingCartApp createState() => ShoppingCartApp();
}

class ShoppingCartApp extends State<shoppingCart> {
  double precioTotal = 0;
  String idCart = "";
  TextEditingController precioT = TextEditingController();
  borrarCarrito(String idCart) {
    final firebase = FirebaseFirestore.instance;
    firebase.collection("Carrito").doc(idCart).delete();
  }

  borrarIdCarrito(String idUser) async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Carrito");
      QuerySnapshot cart = await ref.get();

      if (cart.docs.length != 0) {
        for (var cursor in cart.docs) {
          if (cursor.get("UserId") == idUser) {
            ref.doc(cursor.id).delete();
          }
        }
      }
    } catch (e) {
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
        title: Text("widget.idUser"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Carrito").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                precioTotal = 0;
                return ListView.builder(
                    itemCount:
                        snapshot.data!.docs.length, // define las iteraciones
                    itemBuilder: (BuildContext context, int index) {
                      TextEditingController precio = TextEditingController();
                      if (snapshot.data!.docs[index].get("UserId") ==
                          widget.idUser) {
                        precio.text =
                            snapshot.data!.docs[index].get("total").toString();
                        this.precioTotal +=
                            snapshot.data!.docs[index].get("total");
                        precioT.text =
                            "Total                  \$ " + precioTotal.toString();
                        this.idCart = snapshot.data!.docs[index].id;
                        return new Card(
                          child: new Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Row(children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              .get("NombreTienda"),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(snapshot.data!.docs[index]
                                              .get("NombreItem"))),
                                      Text(
                                        snapshot.data!.docs[index]
                                            .get("PrecioItem")
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.indigo,
                                        ),
                                      ),
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(children: [
                                        Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 10,
                                                top: 10,
                                                left: 30,
                                                right: 30),
                                            child: Text('Cant.', style: TextStyle(fontWeight: FontWeight.bold),)),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 10,
                                            top: 10,
                                            left: 50,
                                            right: 50),
                                        child: Text(snapshot.data!.docs[index]
                                            .get("Cantidad")
                                            .toString())),

                                  ])),
                                  Container(
                                    width: 80,
                                    height: 80,
                                    child: TextField(
                                      controller: precio,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: Colors.red,
                                    //hoverColor: Colors.pink,
                                    //foregroundColor: Colors.black,
                                    mini: true,
                                    onPressed: () {
                                      mensaje(
                                          "Borrar",
                                          "¿Desea borrar el artículo del carrito?",
                                          snapshot.data!.docs[index].id);
                                    },
                                    //hoverColor: Colors.indigo,
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    heroTag: null,
                                  )
                                ]),
                              )
                            ],
                          ),
                        );
                      } else {
                        return new Card();
                      }
                    });
              },
            ),
          ),
          Container(
              /*decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.circular(20)),*/
              child: Padding(
                padding:
                EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 15),
                child: TextField(
                  controller: precioT,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(600))),
              onPressed: () {
                borrarIdCarrito(widget.idUser);
                Navigator.of(context).pop();
              },
              child: Text("Pagar", style: TextStyle(
                fontSize: 18,
                //fontWeight: FontWeight.bold,
              ),),
            ),
          ),

        ],
      ),
    );
  }

  void mensaje(String titulo, String mess, String idCart) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  borrarCarrito(idCart);
                  Navigator.of(context).pop();
                },
                child:
                    Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    Text("Cancelar", style: TextStyle(color: Colors.blueGrey)),
              )
            ],
          );
        });
  }
}
