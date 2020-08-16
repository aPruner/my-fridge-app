class ShoppingListsService {
  static final String getShoppingListsByHouseholdIdQuery = """
  query {
    shoppingLists(householdId: \$householdId) {
      id,
      name,
      userId,
      householdId,
      createdAt
    }
  }
  """;

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
