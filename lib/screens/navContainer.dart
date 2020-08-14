import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../widgets/bottomNavBar.dart';
import './fridge.dart';
import './home.dart';
import 'shoppingLists.dart';

class NavContainerScreen extends StatefulWidget {
  NavContainerScreen({Key key, @required this.authService}) : super(key: key);

  final AuthService authService;
  // the authService isn't used just yet in the nav screen, but will be needed for log out

  @override
  _NavContainerScreenState createState() => _NavContainerScreenState();
}

class _NavContainerScreenState extends State<NavContainerScreen> {
  // current index to determine which screen renders
  int _currentIndex = 0;

  // init screens
  static final HomeScreen _homeScreen = HomeScreen();
  static final ShoppingListsScreen _shoppingListsScreen = ShoppingListsScreen();
  static final FridgeScreen _fridgeScreen = FridgeScreen();

  final List<Widget> _children = [
    _homeScreen,
    _shoppingListsScreen,
    _fridgeScreen,
  ];

  static final Map _floatingActionButtonMap = {
    0: null,
    1: _shoppingListsScreen.renderFloatingActionButton(),
    2: _fridgeScreen.renderFloatingActionButton(),
  };

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar:
          BottomNavBar(onTabTapped: onTabTapped, currentIndex: _currentIndex),
      floatingActionButton: _floatingActionButtonMap[_currentIndex],
    );
  }
}
