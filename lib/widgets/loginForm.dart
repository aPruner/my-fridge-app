import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './loadingSpinner.dart';
import './loginInput.dart';
import '../services/auth.dart';
import '../screens/navContainer.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key, @required this.authService}) : super(key: key);

  final AuthService authService;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void handlePressLoginWithGoogleButton() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return LoadingSpinner(
            backgroundColor: Colors.white,
          );
        },
      ),
    );
    widget.authService.loginWithGoogle().whenComplete(
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return NavContainerScreen(
                authService: widget.authService,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/my-fridge-login-wordmarks.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 55.0),
            child: ButtonTheme(
              minWidth: 400.0,
              height: 50.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              buttonColor: Colors.black,
              splashColor: Colors.grey,
              child: RaisedButton(
                child: Text(
                  'Log in with Google',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => handlePressLoginWithGoogleButton(),
              ),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
