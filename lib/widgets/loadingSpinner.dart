import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends StatelessWidget {
  LoadingSpinner({Key key, this.backgroundColor}) : super(key: key);

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: this.backgroundColor != null
            ? this.backgroundColor
            : Colors.transparent,
        child: SpinKitRing(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
