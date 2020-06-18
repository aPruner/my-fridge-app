import 'package:flutter/material.dart';
import '../services/auth.dart';
import './login.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key key, 
    @required this.authService
  }) : super(key: key);

  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Text('Welcome to MyFridge, you are logged in!'), 
          ),
        ),
      )
    );
  }
}