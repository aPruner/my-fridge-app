import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key, @required this.getIncomingScreen}) : super(key: key);

  final Function getIncomingScreen;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index, BuildContext context) {
    Widget incomingScreen = widget.getIncomingScreen(index);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return incomingScreen;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text('Shopping Lists')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.kitchen),
          title: Text('Fridge')
        )
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (int index) => _onItemTapped(index, context),
    );
  }
}