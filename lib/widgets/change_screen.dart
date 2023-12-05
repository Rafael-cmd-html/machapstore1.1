import 'package:flutter/material.dart';

class ChangScreen extends StatelessWidget {
  final String? descriptionLink;
  final VoidCallback? onTap;
  final String? name;
  ChangScreen({this.name, this.onTap, this.descriptionLink});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          descriptionLink!,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap!,
          child: Text(
            name!,
            style: TextStyle(color: Colors.cyan),
          ),
        )
      ],
    );
  }
}
