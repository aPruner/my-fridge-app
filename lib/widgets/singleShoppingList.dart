import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/shoppingLists.dart';
import 'pageTitle.dart';
import 'pageSubtitle.dart';

class SingleShoppingList extends StatelessWidget {
  SingleShoppingList({Key key, @required this.shoppingListData})
      : super(key: key);

  final Map shoppingListData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 40.0,
            ),
            child: PageTitle(
              text: shoppingListData['name'],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: PageSubTitle(
              text: shoppingListData['description'],
              topPadding: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}
