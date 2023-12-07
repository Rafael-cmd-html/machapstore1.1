import 'package:flutter/material.dart';
import 'package:machapstore1/widgets/myTextFormField.dart';

class HomePage extends StatelessWidget {
  Widget _buildFeatureProduct(
      {String? name, double? price, String? image, String, String? categorie}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 270,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 190,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/productsImages/$categorie/$image')),
              ),
            ),
            Text(
              "\$ $price",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.grey[700]),
            ),
            Text(
              name!,
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: Colors.amber[400],
        ),
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: const FractionalOffset(1.0, 0.0),
                      end: const FractionalOffset(0.0, 0.0),
                      colors: <Color>[Colors.yellow, Colors.orange]))),
          toolbarHeight: 55,
          elevation: 0.0,
          backgroundColor: Colors.amber[500],
          leading: IconButton(
            icon: Icon(Icons.manage_accounts_outlined),
            color: Colors.grey[800],
            onPressed: () {
              _key.currentState?.openDrawer();
            },
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
              color: Colors.grey[800],
              iconSize: 25,
            ),
          ],
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(
                  height: 120,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextFormField(),
                          SizedBox(height: 16),
                          Text(
                            "Destacados",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Todos",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    height: 270,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        _buildFeatureProduct(
                            name: "Mochila",
                            price: 200.0,
                            image: "backpack.png",
                            categorie: "accesorios"),
                        SizedBox(width: 16),
                        _buildFeatureProduct(
                            name: "Bocina",
                            price: 500.0,
                            image: "speaker.png",
                            categorie: "electro"),
                      ],
                    ))
              ],
            )));
  }
}
