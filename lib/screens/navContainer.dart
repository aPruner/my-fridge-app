import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../widgets/bottomNavBar.dart';
import './fridge.dart';
import './home.dart';
import './shopping.dart';

class NavContainerScreen extends StatefulWidget {
  NavContainerScreen({
    Key key, 
    @required this.authService
  }) : super(key: key);

  final AuthService authService;
  // the authService isn't used just yet in the nav screen, but will be needed for log out

  @override
  _NavContainerScreenState createState() => _NavContainerScreenState();
  
}

class _NavContainerScreenState extends State<NavContainerScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    ShoppingScreen(),
    FridgeScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: _children[_currentIndex],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(onTabTapped: onTabTapped, currentIndex: _currentIndex),
    );
  }
}