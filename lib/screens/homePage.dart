import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:machapstore1/screens/listProducts.dart';
import 'package:machapstore1/widgets/myTextFormField.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'assets/images/productsImages/accesorios/walletmen.png',
    'assets/images/productsImages/accesorios/gloves.png',
    'assets/images/productsImages/accesorios/walletwoman.png',
    'assets/images/productsImages/accesorios/neck.png',
    'assets/images/productsImages/accesorios/scarf.png',
  ];
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
          color: Color(0XFFffd973),
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
        backgroundColor: Color(0XFFffd973),
        child: Container(
            height: 50,
            child: Image(
              image: AssetImage("assets/images/categoriesIcons/$image"),
            )));
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool homeSelected = true;
  bool cartSelected = false;
  bool aboutSelected = false;
  bool logOutSelected = false;
  bool contactSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF708090),
      key: _key,
      drawer: Drawer(
        backgroundColor: Color(0XFFffd973),
        child: Column(children: <Widget>[
          UserAccountsDrawerHeader(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            accountName: Text(
              "Rafael",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey[400],
                radius: 20,
                child:
                    Image.asset("assets/images/resourceImages/userIcon.png")),
            decoration: BoxDecoration(color: Color(0XFF708090)),
            accountEmail: Text("rafael@gmail.com",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            selected: homeSelected,
            selectedTileColor: Color(0XFF708090),
            onTap: () {
              setState(() {
                homeSelected = true;
                contactSelected = false;
                aboutSelected = false;
                logOutSelected = false;
                cartSelected = false;
              });
            },
            leading: Icon(
              Icons.home,
              color: homeSelected ? Colors.white : Color(0xFF30383F),
            ),
            title: Text("Inicio",
                style: TextStyle(
                  color: homeSelected ? Colors.white : Color(0xFF30383F),
                )),
          ),
          ListTile(
            selected: cartSelected,
            selectedTileColor: Color(0XFF708090),
            onTap: () {
              setState(() {
                cartSelected = true;
                contactSelected = false;
                aboutSelected = false;
                logOutSelected = false;
                homeSelected = false;
              });
            },
            leading: Icon(
              Icons.shopping_cart,
              color: cartSelected ? Colors.white : Color(0xFF30383F),
            ),
            title: Text("Carrito",
                style: TextStyle(
                  color: cartSelected ? Colors.white : Color(0xFF30383F),
                )),
          ),
          ListTile(
            selected: aboutSelected,
            selectedTileColor: Color(0XFF708090),
            onTap: () {
              setState(() {
                aboutSelected = true;
                contactSelected = false;
                cartSelected = false;
                logOutSelected = false;
                homeSelected = false;
              });
            },
            leading: Icon(
              Icons.info,
              color: aboutSelected ? Colors.white : Color(0xFF30383F),
            ),
            title: Text("Sobre nosotros",
                style: TextStyle(
                  color: aboutSelected ? Colors.white : Color(0xFF30383F),
                )),
          ),
          ListTile(
            selected: contactSelected,
            selectedTileColor: Color(0XFF708090),
            onTap: () {
              setState(() {
                contactSelected = true;
                cartSelected = false;
                aboutSelected = false;
                logOutSelected = false;
                homeSelected = false;
              });
            },
            leading: Icon(
              Icons.phone,
              color: contactSelected ? Colors.white : Color(0xFF30383F),
            ),
            title: Text("Contáctanos",
                style: TextStyle(
                  color: contactSelected ? Colors.white : Color(0xFF30383F),
                )),
          ),
          ListTile(
            selected: logOutSelected,
            selectedTileColor: Color(0XFF708090),
            onTap: () {
              setState(() {
                logOutSelected = true;
                contactSelected = false;
                aboutSelected = false;
                cartSelected = false;
                homeSelected = false;
              });
            },
            leading: Icon(
              Icons.exit_to_app,
              color: logOutSelected ? Colors.white : Color(0xFF30383F),
            ),
            title: Text("Cerrar sesión",
                style: TextStyle(
                  color: logOutSelected ? Colors.white : Color(0xFF30383F),
                )),
          ),
        ]),
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
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 0.0,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: images.map((String imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
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
              height: 90,
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
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (ctx) => ListProducts(
                                                  name: "Destacados")));
                                    },
                                    child: Text(
                                      "Ver más",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                              ],
                            )
                          ]))
                ],
              ),
            ),
            Container(
                height: 250,
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
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => ListProducts(
                                            name: "Recien llegados")));
                              },
                              child: Text(
                                "Ver más",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ))
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
