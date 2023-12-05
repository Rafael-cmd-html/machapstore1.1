import 'package:flutter/material.dart';
import 'package:machapstore1/screens/signUp.dart';
import 'package:machapstore1/widgets/my_button.dart';

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

class _login_state extends State<login> {
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
        body: Form(
            key: _form_key,
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 300,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Please fill email";
                          } else if (!reg_exp_email.hasMatch(value)) {
                            return "Email is invalid";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
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
                            border: OutlineInputBorder(),
                            hintText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  obscure_text = !obscure_text;
                                });
                              },
                              child: Icon(
                                  obscure_text == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black),
                            ),
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                      my_button(
                        name: "Login",
                        onPressed: () {
                          validation();
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("I don't have an account"),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => sign_up()));
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(color: Colors.cyan),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ))));
  }
}
