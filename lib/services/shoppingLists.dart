class ShoppingListsService {
  static final String getShoppingListsByHouseholdIdQuery = """
  query ShoppingLists(\$householdId: Int) {
    shoppingLists(householdId: \$householdId) {
      id,
      name,
      description,
      userId,
      householdId,
      createdAt
    }
  }
  """;

  // TODO: Fix these mutations
  static final String createShoppingListMutation = """
  mutation {
    createShoppingList(
      name: \$name,
      userId: \$userId,
      householdId: \$householdId,
    ) {
      id
    }
  }
  """;

  static final String updateShoppingListMutation = """
  mutation {
    updateShoppingList(
      id: \$id,
      name: \$name,
      userId: \$userId,
      householdId: \$householdId,
    ) {
      id
    }
  }
  """;
}
