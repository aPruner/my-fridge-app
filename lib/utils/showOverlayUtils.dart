import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/fullscreenOverlay.dart';
import '../widgets/createFoodItemForm.dart';
import '../widgets/createShoppingListForm.dart';
import '../widgets/singleShoppingList.dart';
import '../widgets/singleFoodItem.dart';

// Class that takes care of rendering various overlay screens
class ShowOverlay {
  static void showCreateFoodItemOverlay(BuildContext context) {
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

  static void showViewSingleFoodItemOverlay(
      BuildContext context, Map foodItemData, String shoppingListName) {
    Navigator.of(context).push(
      FullScreenOverlay(
        RouteSettings(
          arguments: FullScreenOverlayRouteArguments(
            SingleFoodItem(
              foodItemData: foodItemData,
              shoppingListName: shoppingListName,
            ),
          ),
        ),
        ImageFilter.blur(),
      ),
    );
  }

  static void showViewSingleShoppingListOverlay(
      BuildContext context, Map shoppingListData) {
    Navigator.of(context).push(
      FullScreenOverlay(
        RouteSettings(
          arguments: FullScreenOverlayRouteArguments(
            SingleShoppingList(
              shoppingListData: shoppingListData,
            ),
          ),
        ),
        ImageFilter.blur(),
      ),
    );
  }

  static void showCreateShoppingListOverlay(
    BuildContext context,
  ) {
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
}
