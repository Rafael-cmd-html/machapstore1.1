import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  final int? price;
  final String? name;
  final String? image;
  CheckOut({this.image, this.name, this.price});
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
                            height: 35,
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text("Cantidad"),
                                Text("1"),
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

  Widget _buildBottomDetails({String? startName, String? endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(startName!),
        Text(endName!),
      ],
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
            'Comprar',
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
          "¡Ya casi es tuyo!",
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildFavoriteCard(),
                _buildFavoriteCard(),
                _buildFavoriteCard(),
                _buildFavoriteCard(),
                _buildFavoriteCard(),
                _buildFavoriteCard(),
                Container(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildBottomDetails(
                          startName: "Your Price",
                          endName: ("\$ 600.00"),
                        ),
                        _buildBottomDetails(
                          startName: "Descuento",
                          endName: ("3%"),
                        ),
                        _buildBottomDetails(
                          startName: "Costo envío",
                          endName: ("\$ 60.00"),
                        ),
                        _buildBottomDetails(
                          startName: "Total",
                          endName: ("\$ 1200.00"),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
