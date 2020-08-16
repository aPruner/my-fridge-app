import 'package:flutter/material.dart';
import '../widgets/pageTitle.dart';
import '../widgets/pageSubtitle.dart';
import '../widgets/tappableCard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  // TODO: Map cards over dummy data
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
                text: 'Home',
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageSubTitle(
                  text: 'Recent Shopping Lists',
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
                PageSubTitle(
                  text: 'Fridge Status',
                  topPadding: 20.0,
                ),
                TappableCard(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.kitchen),
                      title: Text('Staples'),
                      subtitle:
                          Text('1 dozen eggs, 1 2L milk carton, 6 bananas'),
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
