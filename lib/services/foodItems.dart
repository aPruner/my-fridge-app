class FoodItemsService {
  static final String getFoodItemsByHouseholdIdQuery = """
  query FoodItems(\$householdId: Int) {
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

  // TODO: Fix these mutations
  static final String createFoodItemMutation = """
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

  static final String updateFoodItemMutation = """
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
