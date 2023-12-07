import 'package:flutter/material.dart';

class ListProducts extends StatelessWidget {
  Widget _buildFeatureProduct({
    String? name,
    double? price,
    String? image,
    String? categorie,
  }) {
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
              height: 150,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/productsImages/$categorie/$image'),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "\$ $price",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color(0XFF393939),
              ),
            ),
            SizedBox(height: 5),
            Text(
              name!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 17, color: Color(0XFF393939)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF708090),
      appBar: AppBar(
        toolbarHeight: 55,
        backgroundColor: Color(0XFF708090),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: <Widget>[
                  _buildFeatureProduct(
                    name: "Mochila",
                    price: 200.0,
                    image: "backpack.png",
                    categorie: "accesorios",
                  ),
                  _buildFeatureProduct(
                    name: "Invierno kit",
                    price: 450.0,
                    image: "glovesandhat.png",
                    categorie: "accesorios",
                  ),
                  _buildFeatureProduct(
                    name: "Buff",
                    price: 150.0,
                    image: "neck.png",
                    categorie: "accesorios",
                  ),
                  _buildFeatureProduct(
                    name: "Bufanda",
                    price: 250.0,
                    image: "scarf.png",
                    categorie: "accesorios",
                  ),
                  _buildFeatureProduct(
                    name: "Cosmetiquera",
                    price: 300.0,
                    image: "makeupbag.png",
                    categorie: "accesorios",
                  ),
                  _buildFeatureProduct(
                    name: "Bocina alta resolucion",
                    price: 450.0,
                    image: "speaker2.png",
                    categorie: "electro",
                  ),
                  _buildFeatureProduct(
                    name: "Celular alta gama",
                    price: 4500.0,
                    image: "cel4.png",
                    categorie: "phones",
                  ),
                  _buildFeatureProduct(
                    name: "monitor",
                    price: 3500.0,
                    image: "monitor.png",
                    categorie: "electro",
                  ),
                  _buildFeatureProduct(
                    name: "Laptop HP",
                    price: 17500.0,
                    image: "laptop.png",
                    categorie: "electro",
                  ),
                  _buildFeatureProduct(
                    name: "Laptop Acer",
                    price: 17500.0,
                    image: "laptop2.png",
                    categorie: "electro",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
