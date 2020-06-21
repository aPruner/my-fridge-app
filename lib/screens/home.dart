import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../widgets/bottomNavBar.dart';
import './fridge.dart';
import './shopping.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key key, 
    @required this.authService
  }) : super(key: key);

  final AuthService authService;
  // the authService isn't used just yet in the home screen, but will be needed for log out

  Widget getIncomingScreen(int index) {
    Widget incomingScreen;
    switch (index) {
      case 0:
        incomingScreen = HomeScreen(authService: authService);
        break;
      case 1:
        incomingScreen = FridgeScreen();
        break;
      case 2:
        incomingScreen = ShoppingScreen();
        break;
      default:
        incomingScreen = HomeScreen(authService: authService);
    }
    return incomingScreen;
  }

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
      ),
      bottomNavigationBar: BottomNavBar(getIncomingScreen: getIncomingScreen)
    );
  }
}