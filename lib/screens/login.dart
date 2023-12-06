import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machapstore1/screens/signUp.dart';
import 'package:machapstore1/widgets/changeScreen.dart';
import 'package:machapstore1/widgets/myButton.dart';
import 'package:machapstore1/widgets/myTextFormField.dart';
import 'package:machapstore1/widgets/passwordField.dart';

//Class who is in charge of create a statfulWidget
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

//Regular expresion type variables
String epEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
String epPassword =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

//Variables declaration
RegExp regExpEmail = new RegExp(epEmail);
RegExp regExpPassword = new RegExp(epPassword);
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool obscureText = true;

String? email;
String? password;

//Class loginState who brings up the state for the Login class and build all the screen
class _LoginState extends State<Login> {
  void validation() async {
    final FormState? _form = _formKey.currentState;
    if (_form != null && _form.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email!, password: password!);
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message!),
        ));
      }
    } else {}
  }

//Widget to build the rest of the app, in this case we don´t need a "_build_bottom widget"
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color(0xFF595959), // Color gris #595959
            child: Form(
                key: _formKey,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              // Coloca la imagen redonda aquí
                              CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage('assets/images/machape.png'))
                            ],
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          _buildTextFields(),
                          my_button(
                            name: "Login",
                            onPressed: () {
                              validation();
                            },
                          ),
                          ChangScreen(
                            name: "Signup",
                            descriptionLink: "I don´t have an account",
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => SignUp()));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }

//Widget to build the textFields
  Widget _buildTextFields() {
    return Container(
      height: 200,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MyTextField(
              name: "Email",
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return "Please fill email";
                } else if (!regExpEmail.hasMatch(value)) {
                  return "Email is invalid";
                }
                return null;
              },
            ),
            MyPasswordField(
                name: "Password",
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Please fill password";
                  } else if (value.length < 8) {
                    return "Password is too short, try with 8 chars";
                  } else if (!regExpPassword.hasMatch(value)) {
                    return "Password must contain at least one uppercase, one lower case, at least one digit and one special char ";
                  }
                },
                obscureText: obscureText,
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                  FocusScope.of(context).unfocus();
                }),
          ]),
    );
  }
}
