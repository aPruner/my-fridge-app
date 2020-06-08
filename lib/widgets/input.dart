import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  Input({Key key, @required String placeholderText, @required Function onChanged}) : super(key: key);

  // Are these like default prop values?
  final String placeholderText = '';
  final Function onChanged = () => {};


  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  // TODO: figure out how this works and if I need it
  final _formKey = GlobalKey<FormState>();

  String _value = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.placeholderText,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please fix your grave error.';
        }
        return null;
      },
      onChanged: widget.onChanged,
    );
  }
}