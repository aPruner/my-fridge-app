import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './input.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key, String placeholderText}) : super(key: key);

  final String placeholderText = '';

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // TODO: figure out how this works and if I need it
  final _formKey = GlobalKey<FormState>();

  String _usernameValue = '';
  String _passwordValue = '';

  void _onUsernameChanged(String value) {
    // Not sure if this works or not
    setState(() => _usernameValue = value);
  }

  void _onPasswordChanged(String value) {
    setState(() => _passwordValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: TextStyle(
              fontSize: 28,  
              color: Colors.white 
            ),
            textAlign: TextAlign.left,
          ),

          Input(placeholderText: 'Enter your username', onChanged: _onUsernameChanged),

          Text('Password',
            style: TextStyle(
                fontSize: 28,
                color: Colors.white 
              ),
            textAlign: TextAlign.left,
          ),

          Input(placeholderText: 'Enter your password', onChanged: _onPasswordChanged,),
        ]
      ),
    );
  }
}