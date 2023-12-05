import 'package:flutter/material.dart';
import 'package:machapstore1/screens/login.dart';
import '../widgets/my_button.dart';

class sign_up extends StatefulWidget {
  @override
  _sign_up_state createState() => _sign_up_state();
}

final GlobalKey<FormState> _form_key = GlobalKey<FormState>();
String ep_email =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
String ep_password =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

RegExp reg_exp_email = new RegExp(ep_email);
RegExp reg_exp_password = new RegExp(ep_password);

bool obscure_text = true;

class _sign_up_state extends State<sign_up> {
  void validation() {
    final FormState? _form = _form_key.currentState;
    if (_form != null && _form.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: _form_key,
      child: Container(
        child: Column(children: <Widget>[
          Container(
              height: 100,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
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
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      )),
                  TextFormField(
                      validator: (value) {
                        if (value == null) {
                          return "Please fill email";
                        } else if (!reg_exp_email.hasMatch(value)) {
                          return "Email is invalid";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      )),
                  TextFormField(
                      obscureText: obscure_text,
                      validator: (value) {
                        if (value == null) {
                          return "Please fill password";
                        } else if (value.length < 8) {
                          return "Password is too short, try with 8 chars";
                        } else if (!reg_exp_password.hasMatch(value)) {
                          return "Password must contain at least one uppercase, one lower case, at least one digit and one special char ";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscure_text = !obscure_text;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                              obscure_text == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      )),
                  my_button(
                      onPressed: () {
                        validation();
                      },
                      name: "SignUp"),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Do you have already an account? "),
                        GestureDetector(
                          child: Text("Login",
                              style: TextStyle(color: Colors.cyan)),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (ctx) => login()));
                          },
                        )
                      ])
                ],
              ))
        ]),
      ),
    )));
  }
}
