import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class dropdownKonversi extends StatelessWidget {
  const dropdownKonversi({
    Key key,
    @required this.listItem,
    @required String newValue,
    @required this.dropdownOnChanged,
  }) : _newValue = newValue, super(key: key);

  final List<String> listItem;
  final String _newValue;
  final Function dropdownOnChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValue,
      onChanged: dropdownOnChanged,
    );
  }
}