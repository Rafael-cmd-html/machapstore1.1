import 'package:flutter/material.dart';
import 'package:machapstore1/screens/homePage.dart';

class DetailScreen extends StatefulWidget {
  final String? image;
  final String? name;
  final double? price;

  DetailScreen({this.image, this.name, this.price});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  Widget _buildSizeProduct({String? name}) {
    return Container(
      height: 40,
      width: 40,
      color: Color(0XFFF2f2f2),
      child: Center(
        child: Text(
          name!,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget _buildColorProduct({Color? color}) {
    return Container(height: 40, width: 40, color: color!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detalles del producto",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0XFF708090),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => HomePage()));
          },
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
        color: Color(0XFF708090),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Container(
                    width: 350,
                    child: Card(
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(widget.image!))),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.name!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFFffd973)),
                                ),
                                Text(
                                  "\$ ${widget.price}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Descripción",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFFffd973)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 180,
                        child: Wrap(
                          children: <Widget>[
                            Text(
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                                "Suspendisse lectus leo, semper ut tellus sit amet, convallis euismod mauris. Nam porta elit eu euismod condimentum. Aliquam a sapien ex. Aliquam erat volutpat. Proin volutpat nibh at purus semper suscipit. Phasellus dictum tortor a ipsum luctus tincidunt. "),
                          ],
                        ),
                      ),
                      Text(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0XFFffd973)),
                          "Size"),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 260,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _buildSizeProduct(name: "S"),
                              _buildSizeProduct(name: "M"),
                              _buildSizeProduct(name: "L"),
                              _buildSizeProduct(name: "XL"),
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0XFFffd973)),
                          "Color"),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 260,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildColorProduct(color: Colors.blue[200]),
                            _buildColorProduct(color: Colors.green[200]),
                            _buildColorProduct(color: Colors.red[200]),
                            _buildColorProduct(color: Colors.yellow[200]),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Cantidad",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0XFFffd973),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 30,
                        width: 100,
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
                                  if (count >= 1) {
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
                                color: Color(0XFFffd973),
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        // ... (otras propiedades del Container)
                        child: ElevatedButton(
                          onPressed: () {
                            // Manejar la acción cuando se presiona el botón
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // Color de fondo del botón
                            minimumSize: Size(
                                double.infinity, 45), // Tamaño mínimo del botón
                          ),
                          child: Text(
                            'Confirmar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
