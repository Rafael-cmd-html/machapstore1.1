import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machapstore1/screens/signUp.dart';
import 'package:machapstore1/widgets/change_screen.dart';
import 'package:machapstore1/widgets/my_button.dart';
import 'package:machapstore1/widgets/my_text_form_field.dart';
import 'package:machapstore1/widgets/password_text_field.dart';

class login extends StatefulWidget {
  @override
  _login_state createState() => _login_state();
}

final GlobalKey<FormState> _form_key = GlobalKey<FormState>();
bool obscure_text = true;
String ep_email =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
String ep_password =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

RegExp reg_exp_email = new RegExp(ep_email);
RegExp reg_exp_password = new RegExp(ep_password);

String? email;
String? password;

class _login_state extends State<login> {
  void validation() async {
    final FormState? _form = _form_key.currentState;
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
                key: _form_key,
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
                            name: "SignUp",
                            descriptionLink: "I don´t have an account",
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => sign_up()));
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
                } else if (!reg_exp_email.hasMatch(value)) {
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
                  } else if (!reg_exp_password.hasMatch(value)) {
                    return "Password must contain at least one uppercase, one lower case, at least one digit and one special char ";
                  }
                },
                obscure_text: obscure_text,
                onTap: () {
                  setState(() {
                    obscure_text = !obscure_text;
                  });
                  FocusScope.of(context).unfocus();
                }),
          ]),
    );
  }
}
