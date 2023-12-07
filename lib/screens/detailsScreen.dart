import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  Widget _buildSizeProduct({String? name}) {
    return Container(
      width: 240,
      child: Row(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            color: Color(0XFFF2f2f2),
            child: Center(
              child: Text(
                name!,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        color: Color(0XFF708090),
        child: Column(
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
                            image: AssetImage(
                                "assets/images/productsImages/accesorios/gloves.png"))),
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
                              "Winter gloves",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFffd973)),
                            ),
                            Text(
                              "\$ 30.0",
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
                    height: 140,
                    child: Wrap(
                      children: <Widget>[
                        Text(
                            style: TextStyle(fontSize: 15, color: Colors.white),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
