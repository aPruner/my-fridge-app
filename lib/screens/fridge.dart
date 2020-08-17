import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/foodItems.dart';
import '../widgets/createFoodItemForm.dart';
import '../widgets/fullscreenOverlay.dart';
import '../widgets/pageTitle.dart';
import '../widgets/pageSubtitle.dart';
import '../widgets/tappableCard.dart';

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

  Widget renderLoadingSpinner() {
    return Center(
      child: SpinKitRing(
        color: Colors.black,
        size: 50.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          documentNode: gql(FoodItemsService.getFoodItemsByHouseholdIdQuery),
          variables: {
            // TODO: Get this from the user when auth stuff is sorted out and user is available here
            'householdId': 1,
          },
          pollInterval: 5,
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          // For debugging, print the error to console as well
          if (result.hasException) {
            print(result.exception.toString());
          }

          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 30.0,
            ),
            child: ListView(
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
                      text:
                          'All Food Items', // TODO: Create sections based on category, will require some data manipulation (filtering/reshaping)
                      topPadding: 0.0,
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
                            ? renderLoadingSpinner()
                            // TODO: Get this column to scroll, seems like a hard problem to solve. Likely will need to use a ListView and do some debugging
                            : Column(
                                children: result.data['foodItems']
                                    .map<TappableCard>((foodItem) {
                                  return TappableCard(
                                    children: <Widget>[
                                      ListTile(
                                        leading: Icon(Icons.kitchen),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                        ),
                                        title: Text(foodItem['name']),
                                        subtitle: foodItem['unit'] != null &&
                                                foodItem['unit'] != ''
                                            ? Text(
                                                foodItem['unit'],
                                              )
                                            : null,
                                        trailing: Text(
                                          foodItem['amount'].toString(),
                                          style: TextStyle(
                                            fontSize: 26.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                    onTap: () {
                                      print('Tapped');
                                    },
                                  );
                                }).toList(),
                              ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
