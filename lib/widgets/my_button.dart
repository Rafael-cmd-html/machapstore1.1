import 'package:flutter/material.dart';

class my_button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? name;

  my_button({this.name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-0.05, 0.64),
      child: Container(
        height: 48, // Ajusta la altura según sea necesario
        width: 254, // Ajusta el ancho según sea necesario
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black, // Ajusta el color según sea necesario
            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            name!,
            style: TextStyle(
              color:
                  Colors.white, // Ajusta el color del texto según sea necesario
              fontFamily: 'Nunito',
              fontSize: 18, // Ajusta el tamaño de fuente según sea necesario
            ),
          ),
        ),
      ),
    );
  }
}
