import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final double? price;
  final String? name;
  final String? image;
  CartScreen({this.image, this.name, this.price});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;

  Widget _buildFavoriteCard() {
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        color: Color(0XFFffd973),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(widget.image!),
                    ),
                  ),
                ),
                Container(
                    height: 140,
                    width: 200,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name!,
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                          Text(
                            "\$ ${widget.price}",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (count > 1) {
                                        count--;
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  count.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  child: Icon(Icons.add, color: Colors.white),
                                  onTap: () {
                                    setState(
                                      () {
                                        count++;
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        height: 65,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.black, // Color de fondo del botón
            minimumSize: Size(double.infinity, 45), // Tamaño mínimo del botón
          ),
          child: Text(
            'Siguiente página',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Carrito",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0XFF708090),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          _buildFavoriteCard(),
          SizedBox(
            height: 10,
          ),
          _buildFavoriteCard(),
          SizedBox(
            height: 10,
          ),
          _buildFavoriteCard(),
          SizedBox(
            height: 10,
          ),
          _buildFavoriteCard(),
          SizedBox(
            height: 10,
          ),
          _buildFavoriteCard(),
          SizedBox(
            height: 10,
          ),
          _buildFavoriteCard(),
          SizedBox(
            height: 10,
          ),
          _buildFavoriteCard(),
          SizedBox(
            height: 10,
          ),
          _buildFavoriteCard(),
          SizedBox(
            height: 10,
          ),
          _buildFavoriteCard(),
        ],
      ),
    );
  }
}
