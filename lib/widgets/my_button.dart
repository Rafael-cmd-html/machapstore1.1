import 'package:flutter/material.dart';

class my_button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? name;
  my_button({this.name, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 245,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey[400],
          ),
          onPressed: onPressed,
          child: Text(name!),
        ));
  }
}
