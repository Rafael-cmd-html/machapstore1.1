import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
            child: Column(children: <Widget>[
              Container(
                height: 120,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
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
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        child: Container(
                          height: 250,
                          width: 180,
                          color: Color(0xFFE9E9E9),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 120,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/resourceImages/machape.png'))),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ])));
  }
}
