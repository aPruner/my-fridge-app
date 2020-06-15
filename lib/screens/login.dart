import 'package:flutter/material.dart';
import '../widgets/loginForm.dart';
import '../services/auth.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {

  final _AuthService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/login-screen-image.jpg'),
        fit: BoxFit.cover,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100.0),
        child: LoginForm(authService: _AuthService),
      ),
    );
  }
}
