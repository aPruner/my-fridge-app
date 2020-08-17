import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/shoppingLists.dart';
import '../widgets/loadingSpinner.dart';
import '../widgets/pageTitle.dart';
import '../widgets/pageSubtitle.dart';
import '../widgets/tappableCard.dart';
import '../widgets/fullscreenOverlay.dart';
import '../widgets/createShoppingListForm.dart';

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
    Navigator.of(context).push(
      FullScreenOverlay(
        RouteSettings(
          arguments: FullScreenOverlayRouteArguments(
            CreateShoppingListForm(),
          ),
        ),
        ImageFilter.blur(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          documentNode:
              gql(ShoppingListsService.getShoppingListsByHouseholdIdQuery),
          variables: {
            // TODO: Get this from the user when auth stuff is sorted out and user is available here
            'householdId': 1,
          },
          pollInterval: 5,
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            print(result.exception.toString());
          }

          return Container(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 40.0,
                  ),
                  child: PageTitle(
                    text: 'Shopping Lists',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: PageSubTitle(
                    text: 'All Shopping Lists',
                    topPadding: 0.0,
                  ),
                ),
                result.hasException
                    ? Center(
                        child: Text(
                          result.exception.toString(),
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                          ),
                        ),
                      )
                    : result.loading
                        ? LoadingSpinner()
                        : Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.0,
                            ),
                            child: Column(
                              children: result.data['shoppingLists']
                                  .map<TappableCard>((shoppingList) {
                                return TappableCard(
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(Icons.list),
                                      title: Text(shoppingList['name']),
                                      subtitle:
                                          Text(shoppingList['description']),
                                    ),
                                  ],
                                  onTap: () {
                                    print('Tapped');
                                  },
                                );
                              }).toList(),
                            ),
                          ),
              ],
            ),
          );
        });
  }
}
