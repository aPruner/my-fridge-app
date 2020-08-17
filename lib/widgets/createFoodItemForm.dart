import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/foodItems.dart';

class CreateFoodItemForm extends StatefulWidget {
  CreateFoodItemForm({Key key}) : super(key: key);

  @override
  _CreateFoodItemFormState createState() => _CreateFoodItemFormState();
}

class _CreateFoodItemFormState extends State<CreateFoodItemForm> {
  final _formKey = GlobalKey<FormState>();
  String _dropdownValue = 'Fridge';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _unitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: Space out the fields in this form with flex instead of applying padding to each element
    return Mutation(
      options: MutationOptions(
        documentNode: gql(FoodItemsService.createFoodItemMutation),
      ),
      builder: (RunMutation runMutation, QueryResult result) {
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
                  'Create a Food Item',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
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
                      hintText: 'e.g: Bananas',
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
                      labelText: 'Category',
                      hintText: 'e.g: Fruit',
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
                    controller: _categoryController,
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
                      labelText: 'Amount',
                      hintText: 'e.g: 5',
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
                      if (value.isEmpty || int.tryParse(value) == null) {
                        return 'Please enter a numeric value';
                      }
                      return null;
                    },
                    controller: _amountController,
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
                      labelText: 'Unit',
                      hintText: 'e.g: Bunches of 6',
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
                    controller: _unitController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _dropdownValue,
                    isExpanded: true,
                    icon: Icon(Icons.list),
                    iconSize: 40.0,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Add to',
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
                    items: <String>[
                      'Fridge',
                      '(Shopping List) Weekly Groceries',
                      '(Shopping List) Party Time',
                      '(Shopping List) Nice-to-haves'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        _dropdownValue = newValue;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 120.0,
                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            runMutation({
                              'name': _nameController.value.text,
                              'category': _categoryController.value.text,
                              'amount': int.parse(_amountController.value.text),
                              'unit': _unitController.value.text,
                              'householdId': 1,
                              // TODO: Hook up shoppinglistId here
                              'shoppingListId': 2,
                            });
                            Navigator.pop(context);
                          }
                        },
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
      },
    );
  }
}
