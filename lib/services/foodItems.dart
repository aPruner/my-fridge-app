class FoodItemsService {
  final String getFoodItemsByHouseholdIdQuery = """
  query {
    foodItems(householdId: \$householdId) {
      id,
      name,
      category,
      amount,
      unit,
      householdId,
      shoppingListId
    }
  }
  """;

  final String createFoodItemMutation = """
  mutation {
    createFoodItem(
      name: \$name,
      category: \$category,
      amount: \$amount,
      unit: \$unit,
      householdId: \$householdId,
      shoppingListId: \$shoppingListId
    ) {
      id
    }
  }
  """;

  final String updateFoodItemMutation = """
  mutation {
    updateFoodItem(
      id: \$id,
      name: \$name,
      category: \$category,
      amount: \$amount,
      unit: \$unit,
      householdId: \$householdId,
      shoppingListId: \$shoppingListId
    ) {
      id
    }
  }
  """;
}
