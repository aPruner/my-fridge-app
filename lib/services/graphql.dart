import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

class GraphqlService {
  static final HttpLink myFridgeLink = HttpLink(
    uri: "localhost:8080/graphql",
  );

  static final ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: myFridgeLink,
    ),
  );
}
