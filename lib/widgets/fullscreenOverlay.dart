import 'dart:ui';

import 'package:flutter/material.dart';

class FullScreenOverlayRouteArguments {
  final Widget childWidgetToRender;

  FullScreenOverlayRouteArguments(this.childWidgetToRender);
}

// Solution thanks to https://stackoverflow.com/questions/51908187/how-to-make-a-full-screen-dialog-in-flutter
class FullScreenOverlay extends ModalRoute<void> {
  FullScreenOverlayRouteArguments _args;

  @override
  FullScreenOverlay(RouteSettings settings, ImageFilter filter) {
    _args = settings.arguments;
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.white.withOpacity(1.0);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          OverlayWidget(
            childWidgetToRender: _args.childWidgetToRender,
          ),
        ],
      ),
    );
  }

  // This solution from stack overflow is awesome because it's going to teach me how to do animations,
  // as well as teach me how to extend a component widget, which I assume might be good flutter practice
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}

class OverlayWidget extends StatefulWidget {
  OverlayWidget({
    Key key,
    @required this.childWidgetToRender,
  }) : super(key: key);

  final childWidgetToRender;

  @override
  _OverlayWidgetState createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        widget.childWidgetToRender,
      ],
    );
  }
}
