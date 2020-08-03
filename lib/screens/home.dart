import 'package:flutter/material.dart';
import '../widgets/pageTitle.dart';
import '../widgets/pageSubtitle.dart';
import '../widgets/shoppingListCard.dart';
import '../widgets/fridgeStatusCard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

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
                ShoppingListCard(
                  titleText: 'Weekly Groceries',
                  subtitleText: 'We always need eggs and milk!',
                ),
                ShoppingListCard(
                  titleText: 'Party Time',
                  subtitleText: 'Burgers, beers, and snacks!',
                ),
                ShoppingListCard(
                  titleText: 'Nice-to-haves',
                  subtitleText: 'Ice cream and other desserts!',
                ),
                PageSubTitle(
                  text: 'Fridge Status',
                  topPadding: 20.0,
                ),
                FridgeStatusCard(
                  titleText: 'Staples',
                  subtitleText: '1 dozen eggs, 1 2L milk, 6 bananas',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
