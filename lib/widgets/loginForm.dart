import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './input.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // TODO: figure out how this works and if I need it
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Text(
                'MyFridge',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 6.0, vertical: 15.0),
            child: Text(
              'Username',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Input(
            inputController: _usernameController,
            placeholderText: 'Enter your username',
            obscureText: false,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 6.0, vertical: 15.0),
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Input(
            inputController: _passwordController,
            placeholderText: 'Enter your password',
            obscureText: true,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
