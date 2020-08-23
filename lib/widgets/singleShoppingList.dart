import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/foodItems.dart';
import '../utils/showOverlayUtils.dart';
import 'loadingSpinner.dart';
import 'pageTitle.dart';
import 'pageSubtitle.dart';
import 'tappableCard.dart';

class SingleShoppingList extends StatelessWidget {
  SingleShoppingList({Key key, @required this.shoppingListData})
      : super(key: key);

  final Map shoppingListData;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(FoodItemsService.foodItemsQuery),
        variables: {
          'foodItemsQueryInput': {
            'shoppingListId': shoppingListData['id'],
          }
        },
        pollInterval: 5,
      ),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.hasException) {
          print(result.exception.toString());
        }

        return Container(
          // Hack that works for my phone, as for some reason the media query overflows by 24px
          // TODO: Fix this to work for all screen sizes
          height: MediaQuery.of(context).size.height - 24.0,
          child: ListView(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    shoppingListData['description'] != ''
                        ? PageSubTitle(
                            text: shoppingListData['description'],
                            topPadding: 0.0,
                          )
                        : SizedBox
                            .shrink(), // SizedBox.shrink() is the empty widget
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        PageSubTitle(
                          text: 'Items in this list:',
                          topPadding: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: RaisedButton(
                            color: Colors.green,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Create Item',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              ShowOverlay.showCreateFoodItemOverlay(context);
                            },
                          ),
                        ),
                      ],
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
                                      ShowOverlay.showViewSingleFoodItemOverlay(
                                          context,
                                          foodItem,
                                          shoppingListData['name']);
                                    },
                                  );
                                }).toList(),
                              ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
