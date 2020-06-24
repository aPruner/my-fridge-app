import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          child: Text('Welcome to MyFridge, you are logged in!'), 
        ),
      ),
    );
  }
}