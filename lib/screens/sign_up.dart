import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: <Widget>[
          Container(
              height: 100,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 400,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  )),
                  TextFormField(
                      decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  )),
                  TextFormField(
                      decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: Icon(Icons.visibility, color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  )),
                  Container(
                      height: 45,
                      width: 245,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey[400],
                        ),
                        onPressed: () {
                          // Aquí debes colocar el código que se ejecutará al presionar el botón.
                          // Por ejemplo, puedes llamar a una función o navegar a otra pantalla.
                        },
                        child: Text('Sign Up'),
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Do you have already an account?"),
                        GestureDetector(
                          child: Text("Login",
                              style: TextStyle(color: Colors.cyan)),
                        )
                      ])
                ],
              ))
        ]),
      ),
    );
  }
}
