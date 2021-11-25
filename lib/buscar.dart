import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class buscar extends StatefulWidget {
  final String searchWord;
  buscar(this.searchWord);

  @override
  BuscarApp createState() => BuscarApp();
}

class BuscarApp extends State<buscar> {
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
        title: Text('Registro de búsqueda'),
        toolbarHeight: 50,
        elevation: 20.00,
      ),
      body: Container(
        child: Center(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("Tiendas").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              // print(widget.searchWord);
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.data!.docs[index]
                      .get("nombreTienda")
                      .toString()
                      .contains(widget.searchWord)) {
                    return new Card(
                      child: new Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: Row(children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(snapshot.data!.docs[index]
                                          .get("nombreTienda"))),
                                  Text(
                                    snapshot.data!.docs[index].get("descrip"),
                                    style: TextStyle(
                                      color: Colors.green[500],
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
                                  onPressed: () {}, child: Text('Entrar'))
                            ]),
                          )
                        ],
                      ),
                    );
                  }
                  return new Card();

                },
              );
            },
          ),
        ),
      ),
    );
  }
}
