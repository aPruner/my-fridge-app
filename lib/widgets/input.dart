import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input({
    Key key, 
    @required this.inputController,
    @required this.placeholderText,
    @required this.obscureText,
    @required this.onChanged
  }) : super(key: key);

  final TextEditingController inputController;
  final String placeholderText;
  final bool obscureText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: placeholderText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45.0)
        ),
      ),
      style: TextStyle(
        fontSize: 24,
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please fix your grave error.';
        }
        return null;
      },
      controller: inputController,
      onChanged: (value) { print(inputController.text); },
    );
  }

}
