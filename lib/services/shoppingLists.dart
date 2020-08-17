class ShoppingListsService {
  static final String getShoppingListsByHouseholdIdQuery = """
  query ShoppingLists(\$householdId: Int!) {
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

  static final String createShoppingListMutation = """
  mutation CreateShoppingList(\$name: String!, \$description: String!, \$userId: Int!, \$householdId: Int!) {
    createShoppingList(
      name: \$name,
      description: \$description,
      userId: \$userId,
      householdId: \$householdId,
    ) {
      id
    }
  }
  """;

  static final String updateShoppingListMutation = """
  mutation UpdateShoppingList(\$name: String!, \$description: String!, \$userId: Int!, \$householdId: Int!) {
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
