import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TappableCard extends StatelessWidget {
  TappableCard({
    Key key,
    @required this.children,
    @required this.onTap,
  }) : super(key: key);

  final children;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Card(
          child: InkWell(
            child: Column(
              children: children,
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
