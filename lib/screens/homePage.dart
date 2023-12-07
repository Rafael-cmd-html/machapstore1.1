import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:machapstore1/widgets/myTextFormField.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

class HomePage extends StatelessWidget {
  Widget _buildFeatureProduct(
      {String? name, double? price, String? image, String, String? categorie}) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 270,
        width: 180,
        decoration: BoxDecoration(
          color: Color(0XFFd7c7b6),
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
                  color: Color(0XFF393939)),
            ),
            Text(
              name!,
              style: TextStyle(fontSize: 17, color: Color(0XFF393939)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon({String? image}) {
    return CircleAvatar(
        radius: 30,
        backgroundColor: Color(0XFF708090),
        child: Container(
            height: 50,
            child: Image(
              image: AssetImage("assets/images/categoriesIcons/$image"),
            )));
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF708090),
      key: _key,
      drawer: Drawer(
        backgroundColor: Color(0XFF708090),
      ),
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: const FractionalOffset(1.0, 0.0),
                    end: const FractionalOffset(0.0, 0.0),
                    colors: <Color>[Color(0XFF708090), Color(0XFF708090)]))),
        toolbarHeight: 55,
        elevation: 0.0,
        backgroundColor: Colors.amber[500],
        leading: IconButton(
          icon: Icon(Icons.manage_accounts_outlined),
          color: Colors.white,
          onPressed: () {
            _key.currentState?.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 25,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: Colors.white,
            iconSize: 25,
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Container(
                height: 200,
                child: Container(
                    height: 200.0,
                    child: PageView.builder(
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return Image.asset(images[index], fit: BoxFit.cover);
                        }))),
            Container(
                height: 60,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Categorías",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("Ver todo",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ])),
            Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    _buildCategoryIcon(image: "ropa.png"),
                    SizedBox(
                      width: 30,
                    ),
                    _buildCategoryIcon(image: "electronica.png"),
                    SizedBox(
                      width: 30,
                    ),
                    _buildCategoryIcon(image: "telefono.png"),
                    SizedBox(
                      width: 30,
                    ),
                    _buildCategoryIcon(image: "accesorios.png"),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                )),
            Container(
              height: 120,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 50,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Destacados",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Todos",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ]))
                ],
              ),
            ),
            Container(
                height: 270,
                width: double.infinity,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(children: <Widget>[
                        _buildFeatureProduct(
                            name: "Mochila",
                            price: 200.0,
                            image: "backpack.png",
                            categorie: "accesorios"),
                        _buildFeatureProduct(
                            name: "Bocina",
                            price: 500.0,
                            image: "speaker.png",
                            categorie: "electro"),
                        _buildFeatureProduct(
                            name: "Bocina alta resolución",
                            price: 500.0,
                            image: "speaker2.png",
                            categorie: "electro"),
                      ])
                    ])),
            Container(
                height: 50,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Recien llegados",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Todos",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      )
                    ])),
            Container(
                height: 270,
                width: double.infinity,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(children: <Widget>[
                        _buildFeatureProduct(
                            name: "Porta tarjetas",
                            price: 150.0,
                            image: "cardports.png",
                            categorie: "accesorios"),
                        _buildFeatureProduct(
                            name: "Guantes",
                            price: 300.0,
                            image: "gloves.png",
                            categorie: "accesorios"),
                        _buildFeatureProduct(
                            name: "Audio set",
                            price: 1500.0,
                            image: "audioset.png",
                            categorie: "electro"),
                      ])
                    ]))
          ],
        ),
      ),
    );
  }
}
