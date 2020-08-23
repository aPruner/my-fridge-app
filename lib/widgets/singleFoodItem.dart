import 'package:flutter/material.dart';

import '../widgets/pageTitle.dart';
import '../widgets/pageSubtitle.dart';

class SingleFoodItem extends StatelessWidget {
  SingleFoodItem(
      {Key key, @required this.foodItemData, @required this.shoppingListName})
      : super(key: key);

  final Map foodItemData;
  final String shoppingListName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PageTitle(text: 'Item to buy:'),
          PageSubTitle(
            text: 'Name: ' + this.foodItemData['name'],
            topPadding: 10.0,
          ),
          PageSubTitle(
            text: 'Category: ' + this.foodItemData['category'],
            topPadding: 0.0,
          ),
          PageSubTitle(
            text: 'Amount: ' + this.foodItemData['amount'].toString(),
            topPadding: 0.0,
          ),
          PageSubTitle(
            text: 'Unit: ' + this.foodItemData['unit'],
            topPadding: 0.0,
          ),
          PageSubTitle(
            text: 'Shopping List: ' + this.shoppingListName,
            topPadding: 0.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonTheme(
                height: 60.0,
                minWidth: 60.0,
                child: RaisedButton(
                  color: Colors.red,
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    print('Tapped delete food item button');
                  },
                ),
              ),
              ButtonTheme(
                height: 60.0,
                minWidth: 60.0,
                child: RaisedButton(
                  color: Colors.lightBlue,
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    print('Tapped edit food item button');
                  },
                ),
              ),
              ButtonTheme(
                height: 60.0,
                minWidth: 60.0,
                child: RaisedButton(
                  color: Colors.grey,
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
