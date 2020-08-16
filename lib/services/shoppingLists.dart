class ShoppingListsService {
  final String getShoppingListsByHouseholdIdQuery = """
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

  final String createShoppingListMutation = """
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

  final String updateShoppingListMutation = """
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
