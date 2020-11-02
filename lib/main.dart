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

    Map<int, Color> colorSwatch = {
      50: Colors.white,
      100: Colors.white,
      200: Colors.white,
      300: Colors.white,
      400: Colors.white,
      500: Colors.white,
      600: Colors.white,
      700: Colors.white,
      800: Colors.white,
      900: Colors.white,
    };

    return GraphQLProvider(
      client: GraphqlService.getGraphQLClient(),
      child: MaterialApp(
        title: 'MyFridge',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFFFFFFFF, colorSwatch),
          // Set DMSans as the default font
          fontFamily: 'DMSans',
        ),
        home: Scaffold(
          body: LoginScreen(authService: authService),
          resizeToAvoidBottomInset: true,
        ),
      ),
    );
  }
}
