import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'itemRegister.dart';
import 'package:myappmovil_06/itemRegister.dart';


class shopView extends StatefulWidget{
  final String DOC_ID;
  shopView(this.DOC_ID);
  @override
  shopViewApp createState()=> shopViewApp();
}

class shopViewApp extends State<shopView> {
  shopViewApp(){
    validarDatos();
  }
  String nombre = "default name";
  String descrCorta = "defalut short";
  String descrLarga = "default long";
  String logo = "logo.png";
  String tiendaId = "";
  final firebase=FirebaseFirestore.instance;

  validarDatos() async {
    try {
      CollectionReference ref =
      FirebaseFirestore.instance.collection("Tiendas");
      QuerySnapshot usuario = await ref.get();
      if (usuario.docs.length != 0) {
        print(widget.DOC_ID.toString() + " prueba");

        for (var cursor in usuario.docs) {
          if (cursor.id == widget.DOC_ID.toString()) {
            //String titulo=cursor.get("nombreTienda");
            this.nombre = cursor.get("nombreTienda");
            this.descrCorta = cursor.get("descrip");
            this.tiendaId = cursor.id;
            // String descrLarga="default long";
            logo = cursor.get("ruta");
          }
        }
      } else {
        print("No hay elementos en la colección");
      }
    } catch (e) {
      print(e);
    }
  }
  registrarCarrito(String idTienda,String idUsuario,String idProducto) async{
    try{
      await firebase
          .collection("Carrito")
          .doc()
          .set({
        "UserId":idUsuario,
        "ShopId":idTienda,
        "ItemId":idProducto,

      });
    }
    catch (e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    this.nombre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  this.descrCorta,
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'Teléfono'),
          _buildButtonColumn(color, Icons.near_me, 'Cómo llegar?'),
          _buildButtonColumn(color, Icons.web, 'Website'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        descrLarga,
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: this.nombre,
      home: Scaffold(
          appBar: AppBar(title: Text(this.nombre), actions: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => itemRegister(tiendaId.toString())));
              },
              tooltip: 'Agregar producto',
              child: const Icon(Icons.add_box),
              //child: Text("add"),
              backgroundColor: Colors.indigo,
            )
          ]),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Image.asset(
                      'image/' + logo,
                      width: 600,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                    titleSection,
                    buttonSection,
                    textSection,
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Productos")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    return ListView.builder(
                      itemCount:
                      snapshot.data!.docs.length, // define las iteraciones
                      itemBuilder: (BuildContext context, int index) {
                        print(snapshot.data!.docs[index].id +
                            " - " +
                            this.tiendaId);
                        if (snapshot.data!.docs[index].get("TiendaId") ==
                            this.tiendaId) {
                          return new Card(
                            child: new Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Text(snapshot
                                                      .data!.docs[index]
                                                      .get("Nombre"))),
                                              Text(
                                                snapshot.data!.docs[index]
                                                    .get("Descripcion"),
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Container(
                                        width: 80,
                                        height: 80,
                                        child: Image.asset(
                                            'image/' /*+snapshot.data!.docs[index].get("ruta")*/),
                                      ),
                                      FloatingActionButton(
                                          onPressed:(){
                                            registrarCarrito(this.tiendaId,"idUsario",(snapshot.data!.docs[index].id));
                                          },
                                          child: const Icon(Icons.add_shopping_cart),
                                          backgroundColor: Colors.blueGrey,
                                          tooltip:'Agregar al carrito'

                                      ),
                                      FloatingActionButton(
                                          onPressed:(){},
                                          // child: const Icon(Icons.add_shopping_cart),
                                          child:Text("Ver"),
                                          backgroundColor: Colors.blue,
                                          tooltip:'Agregar al carrito'

                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return new Card();
                        }
                      },
                    );
                  },
                ),
              )
            ],
          )),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
  /*@override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Comidas Rapidas El Gordo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'Llamar'),
          _buildButtonColumn(color, Icons.near_me, 'Como Llegar'),
          _buildButtonColumn(color, Icons.facebook, 'Facebook'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Productos:'
        'Perros Calientes, Hamburguesas, Pizza, Arepas Rellenas...',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Comidas Rapidas El Gordo',
      home: Scaffold(
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
          title: Text('Comidas Rapidas El Gordo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'image/elgordo.jpg',
              width: 600,
              height: 300,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}*/