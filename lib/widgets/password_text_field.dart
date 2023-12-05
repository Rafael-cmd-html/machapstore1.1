import 'package:flutter/material.dart';

class MyPasswordField extends StatelessWidget {
  final bool? obscure_text;
  final String? Function(String?)? validator;
  final String? name;
  final VoidCallback? onTap;
  void Function(String)? onChanged;

  MyPasswordField(
      {this.name,
      this.obscure_text,
      this.onTap,
      this.validator,
      this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(color: Colors.white),
        obscureText: obscure_text!,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: name,
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
                obscure_text == true ? Icons.visibility : Icons.visibility_off,
                color: Colors.white),
          ),
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15.0)),
        ));
  }
}
