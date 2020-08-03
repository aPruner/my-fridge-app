import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FridgeStatusCard extends StatelessWidget {
  FridgeStatusCard({
    Key key,
    @required this.titleText,
    @required this.subtitleText,
  }) : super(key: key);

  final titleText;
  final subtitleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Card(
          child: InkWell(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.kitchen),
                  title: Text(titleText),
                  subtitle: Text(subtitleText),
                ),
              ],
            ),
            onTap: () {
              print('Tapped');
            },
          ),
        ),
      ),
    );
  }
}
