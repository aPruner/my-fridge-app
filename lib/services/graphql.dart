import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GraphqlService {
  static final String localServerHost =
      DotEnv().env['LOCAL_MYFRIDGE_SERVER_URI'];
  static final String localServerPort =
      DotEnv().env['LOCAL_MYFRIDGE_SERVER_PORT'];
  static final HttpLink myFridgeLink = HttpLink(
    uri: "http://$localServerHost:$localServerPort/graphql",
  );

  static ValueNotifier<GraphQLClient> getGraphQLClient() {
    String localServerHost = DotEnv().env['LOCAL_MYFRIDGE_SERVER_HOST'];
    String localServerPort = DotEnv().env['LOCAL_MYFRIDGE_SERVER_PORT'];
    HttpLink myFridgeLink = HttpLink(
      uri: "http://$localServerHost:$localServerPort/graphql",
    );
    return ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: myFridgeLink,
      ),
    );
  }
}
