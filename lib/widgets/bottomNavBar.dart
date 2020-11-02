import 'package:flutter/material.dart';
import '../styles/colors.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar(
      {Key key, @required this.onTabTapped, @required this.currentIndex})
      : super(key: key);

  final Function onTabTapped;
  final int currentIndex;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text('Shopping Lists'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.kitchen),
          title: Text('Fridge'),
        )
      ],
      currentIndex: widget.currentIndex,
      // TODO: Extract out colours into a theme
      selectedItemColor: MyFridgeColors.darkTeal,
      onTap: widget.onTabTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
