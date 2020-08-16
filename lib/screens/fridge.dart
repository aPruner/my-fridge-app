import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_fridge_app/widgets/tappableCard.dart';
import '../widgets/pageTitle.dart';
import '../widgets/pageSubtitle.dart';
import '../widgets/fullscreenOverlay.dart';
import '../widgets/createFoodItemForm.dart';

class FridgeScreen extends StatelessWidget {
  // Each screen that has a floating action button will have this method
  // TODO: see if creating a wrapper component for the FAB is necessary
  Widget renderFloatingActionButton(BuildContext context) {
    return Container(
      height: 90.0,
      width: 90.0,
      child: FittedBox(
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () {
            _showOverlay(context);
          },
        ),
      ),
    );
  }

  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(
      FullScreenOverlay(
        RouteSettings(
          arguments: FullScreenOverlayRouteArguments(
            CreateFoodItemForm(),
          ),
        ),
        ImageFilter.blur(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 40.0,
              ),
              child: PageTitle(
                text: 'Fridge',
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageSubTitle(
                  text: 'Staples',
                  topPadding: 0.0,
                ),
                TappableCard(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.kitchen),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 20.0,
                      ),
                      title: Text(
                        'Eggs',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Text(
                          '(Unit: dozens)',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      trailing: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 26.0,
                        ),
                      ),
                    ),
                  ],
                  onTap: () {
                    print('Tapped');
                  },
                ),
                TappableCard(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.kitchen),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 20.0,
                      ),
                      title: Text(
                        'Milk',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Text(
                          '(Unit: 2L Cartons)',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      trailing: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 26.0,
                        ),
                      ),
                    ),
                  ],
                  onTap: () {
                    print('Tapped');
                  },
                ),
                TappableCard(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.kitchen),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 20.0,
                      ),
                      title: Text(
                        'Bananas',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Text(
                          '(Unit: single banana)',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      trailing: Text(
                        '6',
                        style: TextStyle(
                          fontSize: 26.0,
                        ),
                      ),
                    ),
                  ],
                  onTap: () {
                    print('Tapped');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
