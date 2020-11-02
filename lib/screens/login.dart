import 'package:flutter/material.dart';
import '../widgets/loginForm.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, @required this.authService}) : super(key: key);

  final authService;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/login-screen-image.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.55),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 200.0),
        child: LoginForm(authService: widget.authService),
      ),
    );
  }
}
