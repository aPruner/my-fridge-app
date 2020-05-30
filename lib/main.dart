import 'package:flutter/material.dart';
import 'package:my_fridge_app/screens/login.dart';

void main() {
  runApp(MyFridgeApp());
}

class MyFridgeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFridge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Websocket Chat Room'),
        ),
        body: Container(
          child: LoginScreen()
        ),
      ),
    );
  }
}
