import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './screens/login.dart';
import './services/auth.dart';
import './services/graphql.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyFridgeApp());
}

class MyFridgeApp extends StatelessWidget {
  // This widget is the root of your application.

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // Set screen orientation to only vertical (no rotation happens when phone is re-oriented to landscape)
    // TODO: Look into whether or not this works on iOS as well
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return GraphQLProvider(
      client: GraphqlService.getGraphQLClient(),
      child: MaterialApp(
        title: 'MyFridge',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          body: LoginScreen(authService: authService),
          resizeToAvoidBottomInset: true,
        ),
      ),
    );
  }
}
