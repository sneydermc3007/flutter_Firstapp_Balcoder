import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
    CustomTextForm(
      { Key? key, required this.name, required this.NameVariable
      }) : super(key: key);

    String name;
    TextEditingController NameVariable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: TextFormField(
        controller: NameVariable,
        decoration: InputDecoration(hintText: name),
      ),
    );
  }
}