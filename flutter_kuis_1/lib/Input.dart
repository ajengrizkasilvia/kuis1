import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.inputUserController,
  }) : super(key: key);

  final TextEditingController inputUserController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: inputUserController,
        decoration: InputDecoration(
          hintText: 'Masukkan Massa',
        ),
        keyboardType: TextInputType.numberWithOptions(),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Enter some text';
          }
          return null;
        });
  }
}