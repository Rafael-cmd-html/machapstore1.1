import 'package:flutter/material.dart';
import 'package:machapstore1/screens/detailsScreen.dart';
import 'package:machapstore1/screens/homePage.dart';

class ListProducts extends StatefulWidget {
  final String? name;
  final snapShot;
  ListProducts({this.name, this.snapShot});
  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  String? get name => widget.name;
  get snapShot => widget.snapShot;
  Widget _buildFeatureProduct({
    String? name,
    int? price,
    String? image,
    String? categorie,
  }) {
    return Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (ctx) => DetailScreen(
                name: featured1?.name,
                price: featured1?.price,
                image: featured1?.image,
                snap: widget.snapShot,
              ),
            ));
          },
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
                  height: 150,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image!),
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
        ));
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
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => HomePage()));
          },
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
                        name!,
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
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: snapShot.data.docs.length,
                itemBuilder: (ctx, index) => _buildFeatureProduct(
                  name: snapShot.data.docs[index]["name"],
                  price: snapShot.data.docs[index]["price"],
                  image: snapShot.data.docs[index]["image"],
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
