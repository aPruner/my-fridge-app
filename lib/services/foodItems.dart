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

  static final String createFoodItemMutation = """
  mutation CreateFoodItem(\$name: String, \$category: String, \$amount: Int, \$unit: String, \$householdId: Int, \$shoppingListId: Int) {
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
  mutation UpdateFoodItem(\$id: Int, \$name: String, \$category: String, \$amount: Int, \$unit: String, \$householdId: Int, \$shoppingListId: Int) {
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
