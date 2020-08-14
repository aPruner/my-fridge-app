import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/pageTitle.dart';
import '../widgets/pageSubtitle.dart';
import '../widgets/tappableCard.dart';
import '../widgets/overlayDialog.dart';

class ShoppingListsScreen extends StatelessWidget {
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
    Navigator.of(context).push(TutorialOverlay());
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
                text: 'Shopping Lists',
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageSubTitle(
                  text: 'All Shopping Lists',
                  topPadding: 0.0,
                ),
                TappableCard(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text('Weekly Groceries'),
                      subtitle: Text('We always need eggs and milk!'),
                    ),
                  ],
                  onTap: () {
                    print('Tapped');
                  },
                ),
                TappableCard(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text('Party Time'),
                      subtitle: Text('Burgers, beers, and snacks!'),
                    ),
                  ],
                  onTap: () {
                    print('Tapped');
                  },
                ),
                TappableCard(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text('Nice-to-haves'),
                      subtitle: Text('Ice cream and other desserts!'),
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
