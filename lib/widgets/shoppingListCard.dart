import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingListCard extends StatelessWidget {
  ShoppingListCard({
    Key key,
    @required this.titleText,
    @required this.subtitleText,
  }) : super(key: key);

  final titleText;
  final subtitleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.list),
              title: Text(titleText),
              subtitle: Text(subtitleText),
            ),
          ],
        ),
      ),
    );
  }
}
