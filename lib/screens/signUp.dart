import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machapstore1/screens/login.dart';
import 'package:machapstore1/widgets/my_text_form_field.dart';
import 'package:machapstore1/widgets/password_text_field.dart';
import '../widgets/my_button.dart';

import '../widgets/change_screen.dart';

class sign_up extends StatefulWidget {
  @override
  _sign_up_state createState() => _sign_up_state();
}

final GlobalKey<FormState> _form_key = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffold_key = GlobalKey<ScaffoldState>();
String ep_email =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
String ep_password =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

RegExp reg_exp_email = new RegExp(ep_email);
RegExp reg_exp_password = new RegExp(ep_password);

bool obscure_text = true;

String? email;
String? password;

class _sign_up_state extends State<sign_up> {
  void validation() async {
    await Firebase.initializeApp();
    final FormState? _form = _form_key.currentState;
    if (_form?.validate() ?? false) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
        // print(result.user?.uid ?? false);
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
        key: _scaffold_key,
        body: Container(
            height: 880,
            color: Color(0xFF595959),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Form(
              key: _form_key,
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
                  } else if (!reg_exp_email.hasMatch(value)) {
                    return "Email is invalid";
                  }
                  return null;
                },
                name: "Email"),
            MyPasswordField(
              obscure_text: obscure_text,
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
                } else if (!reg_exp_password.hasMatch(value)) {
                  return "Password must contain at least one uppercase, one lower case, at least one digit and one special char ";
                }
              },
              name: "Password",
              onTap: () {
                setState(() {
                  obscure_text = !obscure_text;
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
                    MaterialPageRoute(builder: (ctx) => login()));
              },
            )
          ],
        ));
  }
}
