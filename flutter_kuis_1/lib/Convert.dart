import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Convert extends StatelessWidget {
  final Function konvertHandler;
  Convert({Key key, @required this.konvertHandler});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //mengatur posisi button lebar kesamping
      height: 50,
      child: RaisedButton( //widget untuk membuat button
        onPressed: konvertHandler, //untuk dapat diklik kemudian di eks
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Konversi Massa", style: TextStyle(
          fontSize: 15, color: Colors.white)
          ),
      ),
    );
  }
}
