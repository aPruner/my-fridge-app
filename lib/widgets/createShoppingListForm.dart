import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/shoppingLists.dart';

class CreateShoppingListForm extends StatefulWidget {
  CreateShoppingListForm({Key key}) : super(key: key);

  @override
  _CreateShoppingListFormState createState() => _CreateShoppingListFormState();
}

class _CreateShoppingListFormState extends State<CreateShoppingListForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  void handlePressCreateShoppingListButton(
      BuildContext context, GraphQLClient client) async {
    if (_formKey.currentState.validate()) {
      QueryResult result = await client.mutate(
        MutationOptions(
            documentNode: gql(ShoppingListsService.createShoppingListMutation),
            variables: {
              'name': _nameController.value.text,
              'description': _descriptionController.value.text,
              // TODO: Get these from the authenticated user!
              'householdId': 1,
              'userId': 1,
            }),
      );
      if (result.hasException) {
        print(result.exception);
      }
      // TODO: Do a re-query of shopping lists for the shopping lists screen here
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLConsumer(builder: (GraphQLClient client) {
      return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(
            20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Create a Shopping List',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 42.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 30.0,
                ),
                child: TextFormField(
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'e.g: Weekly Staples',
                    labelStyle: TextStyle(
                      fontSize: 26.0,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  bottom: 30.0,
                ),
                child: TextFormField(
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'e.g: Everything we eat on a daily basis',
                    labelStyle: TextStyle(
                      fontSize: 26.0,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _descriptionController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 120.0,
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () =>
                          handlePressCreateShoppingListButton(context, client),
                      child: Text(
                        'Create',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                        ),
                      ),
                      color: Colors.green,
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 120.0,
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                        ),
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
