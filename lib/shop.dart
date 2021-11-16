import 'package:flutter/material.dart';

class shop extends StatefulWidget {
  @override
  ShopApp createState() => ShopApp();
}

class ShopApp extends State<shop> {
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('Comidas Rapidas El Gordo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Text(
                  'Perros Calientes, Hambuguesas y mas...',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            child: Image.asset('image/comida_rapida.png'),
          ),
          ElevatedButton(onPressed: () {}, child:
          Text('Entrar'),
            style: ElevatedButton.styleFrom(
                primary: Colors.red[600],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(600))),
          ),
        ],
      ),
    );



    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.shade900, Colors.redAccent.shade400],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        title: Text('Lista de Tiendas'),
        titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 20.00,

      ),
      body: ListView(
        children: [titleSection, titleSection],
      ),
    );
  }
}
