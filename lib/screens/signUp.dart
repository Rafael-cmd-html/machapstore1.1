import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machapstore1/screens/login.dart';
import 'package:machapstore1/widgets/myTextFormField.dart';
import 'package:machapstore1/widgets/passwordField.dart';
import '../widgets/myButton.dart';

import '../widgets/changeScreen.dart';

//StatefulWidget class after we pass the state with the _sign_up_state class
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

//Variables declaration
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
RegExp regExpEmail = new RegExp(epEmail);
RegExp regExpPassword = new RegExp(epPassword);

bool obscureText = true;

String? email;
String? password;

//RegularExpresion type variables
String epEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
String epPassword =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

//Classs who is in charge of build all the screen, widgets and state of our statefull widget class:SignUp
class _SignUpState extends State<SignUp> {
  void validation() async {
    await Firebase.initializeApp();
    final FormState? _form = _formKey.currentState;
    if (_form?.validate() ?? false) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message!),
        ));
      }
    } else {}
  }

  //Widget root, the most important widget, build all the page with the help from the other two widgets

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: 880,
            color: Color(0xFF595959),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Form(
              key: _formKey,
              child: Container(
                child: Column(children: <Widget>[
                  Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )),
                  SizedBox(),
                  _buildBottom(),
                ]),
              ),
            )))));
  }

//Widget builder for the textFields and passwordfields, made also with other widgets of the app
  Widget _buildAllTextFormField() {
    return Container(
        height: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                // Coloca la imagen redonda aquí
                CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/machape.png'))
              ],
            ),
            MyTextField(
              validator: (value) {
                if (value == null) {
                  return "Please fill name";
                } else if (value.isEmpty) {
                  return "Please fill name";
                } else if (value.length < 6) {
                  return "Name is too short";
                }
                return null;
              },
              name: "Name",
            ),
            MyTextField(
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
                name: "Email"),
            MyPasswordField(
              obscureText: obscureText,
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
              name: "Password",
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
                FocusScope.of(context).unfocus();
              },
            ),
          ],
        ));
  }

//Widget builder for the bottom of the app, bottom button and link to other pages
  Widget _buildBottom() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            _buildAllTextFormField(),
            my_button(
                onPressed: () {
                  validation();
                },
                name: "SignUp"),
            ChangScreen(
              name: "Login",
              descriptionLink: "Already have an account?",
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => Login()));
              },
            )
          ],
        ));
  }
}
