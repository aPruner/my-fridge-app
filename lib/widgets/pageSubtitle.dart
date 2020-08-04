import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageSubTitle extends StatelessWidget {
  PageSubTitle({
    Key key,
    @required this.text,
    @required this.topPadding,
  }) : super(key: key);

  final text;
  final topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.0,
        bottom: 10.0,
        top: topPadding,
      ),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
