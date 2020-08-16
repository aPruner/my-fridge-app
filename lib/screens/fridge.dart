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

  // dummy data to map from
  static final dummyFoodItemData = <Map>[
    {
      "amount": "6",
      "category": "Fruits",
      "householdId": 1,
      "id": 6,
      "name": "Banana",
      "shoppingListId": 2,
      "unit": "single bananas"
    },
    {
      "amount": "2",
      "category": "Dairy",
      "householdId": 1,
      "id": 7,
      "name": "Lactose free milk",
      "shoppingListId": 2,
      "unit": "2l cartons"
    },
    {
      "amount": "3",
      "category": "Fruits",
      "householdId": 1,
      "id": 8,
      "name": "Avocado",
      "shoppingListId": 2,
      "unit": "single avocados"
    },
    {
      "amount": "4",
      "category": "Meats",
      "householdId": 1,
      "id": 9,
      "name": "Chicken",
      "shoppingListId": 2,
      "unit": "breasts"
    },
    {
      "amount": "6",
      "category": "Carbs",
      "householdId": 1,
      "id": 10,
      "name": "Brown Rice",
      "shoppingListId": 2,
      "unit": "2lb bags"
    }
  ];

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
                Column(
                  children: dummyFoodItemData.map<TappableCard>((foodItem) {
                    return TappableCard(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.kitchen),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                          ),
                          title: Text(foodItem['name']),
                          subtitle: Text('(Unit: ${foodItem['unit']})'),
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
